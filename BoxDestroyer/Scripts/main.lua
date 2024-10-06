local version = "1.1.0"
print("Loading version " .. version .. " of BoxDestroyer.")
local config = require "config"

RegisterKeyBind(config.key, config.modifier_keys, function()
	print("Keybind Pressed: Deleting boxes.")

	local firstPersonCharacter = FindFirstOf("BP_FirstPersonCharacter_C")
	local stockManager = FindFirstOf("BP_StockManager_C")
	local despawner = FindFirstOf("BP_Despawner_C")

	local currentlyHeldBoxId

	print("Found " .. #stockManager.Boxes .. " boxes.")

	-- It would be nice if we could scan ALL players in the session to see if ANY of them are carrying a box.
	if firstPersonCharacter.bHoldingItem and IsActorABox(firstPersonCharacter.ItemHeld) and firstPersonCharacter.ItemHeld:IsEmpty() then
		print("Player is holding an empty box. Storing the box's ID for later in order to not delete it.")
		currentlyHeldBoxId = GetActorId(firstPersonCharacter.ItemHeld)
	end

	-- Create a table to store empty boxes
	local emptyBoxes = {}

	-- Collect all empty boxes
	for i = 1, #stockManager.Boxes do
		local box = stockManager.Boxes[i]

		if box:IsEmpty() and not box.bInStorage then
			local boxId = GetActorId(box)
			if currentlyHeldBoxId ~= boxId then
				print("Found empty box with ID '" .. boxId .. "'. Adding it to empty boxes collection.")
				table.insert(emptyBoxes, box)
			end
		end
	end

	print("Found " .. #emptyBoxes .. " boxes to destroy.")

	-- Destroy all empty boxes
	for i = 1, #emptyBoxes do
		local box = emptyBoxes[i]
		print("Destroying empty box.")
		despawner:SERVER_DestroyActor(box)
	end

	return true
end
)

function IsActorABox(actor)
    if not actor:IsValid() then
        print("Actor is not valid. Cannot determine if it is a box.")
        return false
    end

    return actor:IsA("/Game/BPs/BP_Box.BP_Box_C")
end

function GetActorId(actor)
	if not actor:IsValid() then
        print("Actor is not valid. Cannot get the identifier.")
    end

	return actor:GetFullName()
end
print("Successfully loaded version " .. version .. " of BoxDestroyer.")
