local version = "1.2.0"
local modName = "[BoxDestroyer] "
print(modName .. "Loading version " .. version)
local config = require "config"

RegisterKeyBind(config.key, config.modifier_keys, function()
	print(modName .. "Keybind Pressed: Deleting boxes.")

	local firstPersonCharacter = FindFirstOf("BP_FirstPersonCharacter_C")
	local stockManager = FindFirstOf("BP_StockManager_C")
	local despawner = FindFirstOf("BP_Despawner_C")

	local playerCurrentlyHeldBoxId

	print(modName .. "Found " .. #stockManager.Boxes .. " boxes.")

	-- It would be nice if we could scan ALL players in the session to see if ANY of them are carrying a box.
	if firstPersonCharacter.bHoldingItem and IsActorABox(firstPersonCharacter.ItemHeld) and firstPersonCharacter.ItemHeld:IsEmpty() then
		print(modName .. "Player is holding an empty box. Storing the box's ID for later in order to not delete it.")
		playerCurrentlyHeldBoxId = GetActorId(firstPersonCharacter.ItemHeld)
	end

	-- Create a table to store empty boxes
	local emptyBoxes = {}

	-- Collect all empty boxes
	for i = 1, #stockManager.Boxes do
		local box = stockManager.Boxes[i]

		if box:IsEmpty() and not box.bInStorage then
			local boxId = GetActorId(box)
			if not IsAnyEmployeeHoldingBox(boxId) and playerCurrentlyHeldBoxId ~= boxId then
				print(modName .. "Found empty box with ID '" .. boxId .. "'. Adding it to empty boxes collection.")
				table.insert(emptyBoxes, box)
			end
		end
	end

	print(modName .. "Found " .. #emptyBoxes .. " boxes to destroy.")

	-- Destroy all empty boxes
	for i = 1, #emptyBoxes do
		local box = emptyBoxes[i]
		print(modName .. "Destroying empty box.")
		despawner:SERVER_DestroyActor(box)
	end

	return true
end)

function IsAnyEmployeeHoldingBox(boxId)
     local employees = {
         "BP_JohnAnderson_C", -- Tier 1 Day
         "BP_OliviaWilson_C", -- Tier 1 Night
         "BP_SarahThompson_C", -- Tier 2 Day
         "BP_DanielGarcia_C", -- Tier 2 Night
         "BP_JamesMiller_C", -- Tier 3 Day
         "BP_LilyMartinez_C", -- Tier 3 Night
         "BP_EmilyDavis_C", -- Tier 4 Day
         "BP_WilliamHernandez_C", -- Tier 4 Night
         "BP_MichaelBrown_C", -- Tier 5 Day
         "BP_MiaClark_C" -- Tier 5 Night
     }

     for _, employeeName in ipairs(employees) do
         local employee = FindFirstOf(employeeName)
         if employee and employee:IsValid() and employee.IsHolding then
            employeeHeldItemId = GetActorId(employee.HeldActor)
            if boxId == employeeHeldItemId then
                print(modName .. "Employee is holding an empty box with ID '" .. employeeHeldItemId .. "'")
                return true
            end
         end
     end

     return false
end

function IsActorABox(actor)
    if not actor:IsValid() then
        print(modName .. "Actor is not valid. Cannot determine if it is a box.")
        return false
    end

    return actor:IsA("/Game/BPs/BP_Box.BP_Box_C")
end

function GetActorId(actor)
	if not actor:IsValid() then
        print(modName .. "Actor is not valid. Cannot get the identifier.")
    end

	return actor:GetFullName()
end

print(modName .. "Successfully loaded version " .. version)
