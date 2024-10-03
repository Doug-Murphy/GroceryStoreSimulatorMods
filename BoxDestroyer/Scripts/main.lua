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
	
	if firstPersonCharacter.bHoldingItem == true then
		print("The player is currently holding an item and we can't guarantee it is not an empty box. Aborting box deletion process.")
		return
	end
	
	-- local heldItem = firstPersonCharacter.ItemHeld	
	-- print("Stringified heldItem -> " .. tostring(heldItem))
	-- print("Purple Dinosaurs -> " .. heldItem:GetHumanReadableName())
	
	-- local heldItem = {}
	-- firstPersonCharacter:GetHeldItem(heldItem)
	-- PrintTable(heldItem)
	
    -- Collect all empty boxes
    for i = 1, #stockManager.Boxes do
        local box = stockManager.Boxes[i]
	
		-- print("Box" .. tostring(box))
		
		-- if heldItem == box then
			-- print("You're holding this empty box.")
		-- end
		
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

function PrintTable(tbl, depth, n)
  n = n or 0;
  depth = depth or 5;

  if (depth == 0) then
      print(string.rep(' ', n).."...");
      return;
  end

  if (n == 0) then
      print(" ");
  end

  for key, value in pairs(tbl) do
	print("FooKey " .. key)
	print("FooValue " .. type(value))
	print("StringifiedValue " .. tostring(value))
      if (key and type(key) == "number" or type(key) == "string") then
          key = string.format("[\"%s\"]", key);

          if (type(value) == "table") then
              if (next(value)) then
                  print(string.rep(' ', n)..key.." = {");
                  PrintTable(value, depth - 1, n + 4);
                  print(string.rep(' ', n).."},");
              else
                  print(string.rep(' ', n)..key.." = {},");
              end
          else
              if (type(value) == "string") then
                  value = string.format("\"%s\"", value);
              else
                  value = tostring(value);
              end

              print(string.rep(' ', n)..key.." = "..value..",");
          end
      end
  end

  if (n == 0) then
      print(" ");
  end
end