local config = require "config"

RegisterKeyBind(config.key, config.modifier_keys, function()
    print("Keybind Pressed: Deleting boxes.")
	
	local firstPersonCharacter = FindFirstOf("BP_FirstPersonCharacter_C")
	local player = FindFirstOf("BP_Player_C")
    local stockManager = FindFirstOf("BP_StockManager_C")
    local despawner = FindFirstOf("BP_Despawner_C")
    
    print("Found " .. #stockManager.Boxes .. " boxes.")
    
    -- Create a table to store empty boxes
    local emptyBoxes = {}
	
	-- It would be nice if we could scan ALL players in the session to see if ANY of them are carrying something.
	if firstPersonCharacter.bHoldingItem and IsActorABox(firstPersonCharacter.ItemHeld) then
		local heldBoxId = GetActorId(firstPersonCharacter.ItemHeld)

		print("Held box ID -> " .. heldBoxId)
		print("Held item is a box.")-- Its ID is " .. GetActorId(firstPersonCharacter.ItemHeld))
	else
		print("Held item is not a box.")
	end

    -- Collect all empty boxes
    for i = 1, #stockManager.Boxes do
        local box = stockManager.Boxes[i]
		-- local boxCanBeGrabbed = {}

		-- This seems to return true, even if the box is currently being held.
		-- box:CanBeGrabbed(boxCanBeGrabbed)
		-- PrintTable(boxCanBeGrabbed)
	
		-- print("Box" .. tostring(box))
		
		-- if heldItem == box then
			-- print("You're holding this empty box.")
		-- end
		
		-- print("boxCanBeGrabbed -> " .. tostring(boxCanBeGrabbed))

        if box:IsEmpty() and not box.bInStorage then
            table.insert(emptyBoxes, box)
        end
    end
    
    print("Found " .. #emptyBoxes .. " boxes to destroy.")
    
    -- Destroy all empty boxes
    for i = 1, #emptyBoxes do
        local box = emptyBoxes[i]
        print("Destroying empty box.")
        despawner:SERVER_DestroyActor(box)
    end
end)

function IsActorABox(actor)
    if not actor:IsValid() then
        print("Actor is not valid. Cannot determine if it is a box.")
        return false
    end

	return actor:IsA("/Game/BPs/BP_Box.BP_Box_C")
end

function GetActorId(actor)
	if not actor:IsValid() then
        print("Actor is not valid. Cannot get the ID of it.")
        return nil
    end

	return actor:GetName()
end