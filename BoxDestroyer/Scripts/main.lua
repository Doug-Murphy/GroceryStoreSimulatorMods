local config = require "config"

RegisterKeyBind(config.key, config.modifier_keys, function()
	print("Keybind Pressed: Deleting boxes.")

	local firstPersonCharacter = FindFirstOf("BP_FirstPersonCharacter_C")
	local player = FindFirstOf("BP_Player_C")
	local stockManager = FindFirstOf("BP_StockManager_C")
	local despawner = FindFirstOf("BP_Despawner_C")

	print("Found " .. #stockManager.Boxes .. " boxes.")

	-- It would be nice if we could scan ALL players in the session to see if ANY of them are carrying a box.
	if firstPersonCharacter.bHoldingItem and IsActorABox(firstPersonCharacter.ItemHeld) and firstPersonCharacter.ItemHeld:IsEmpty() then
		print("Player is holding an empty box. Aborting box deletion for safety.")
		return false
	else
		print("Player is not holding an empty box. Proceeding with box deletion.")
	end

	-- Create a table to store empty boxes
	local emptyBoxes = {}

	-- Collect all empty boxes
	for i = 1, #stockManager.Boxes do
		local box = stockManager.Boxes[i]

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
