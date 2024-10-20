local config = require "config"

local version = "1.0.0"
local modName = "[FlashMob] "

print(modName .. "Loading version " .. version)

RegisterKeyBind(config.key, config.modifier_keys, function()
    print(modName .. "Starting flash mob!")
    local populationManager = FindFirstOf("BP_PopulationManager_C")

	if populationManager == nil or not populationManager:IsValid() then
		print(modName .. "Could not find BP_PopulationManager_C or it is not valid.")
		return
	end

	if not populationManager:CanSpawn() then
        print(modName .. "Unable to spawn customers. Is your store currently open?")
        return
	end

	populationManager.MaxCustomerCount = config.max_customer_amount
	print(modName .. "Set max customers count to " .. tostring(config.max_customer_amount))

	if (config.max_customer_amount == populationManager.CurrentCustomerCount) then
	    print(modName .. "You currently have the maximum amount of customers that you set in your config. Cannot spawn any customers.")
	    return
	end

	print(modName .. "Current customer count is " .. tostring(populationManager.CurrentCustomerCount) .. ". Spawning " .. tostring(config.max_customer_amount - populationManager.CurrentCustomerCount) .. " customers now.")

    --Calling TrySpawningCars() WITHOUT also calling InvalidateSpawnDelay does not crash after saving. If both are called, the game crashes after saving.
    --However, without calling InvalidSpawnDelay(), then TrySpawningCars() does nothing because the delay has not elapsed in order for a car to spawn.
	for i = populationManager.CurrentCustomerCount, config.max_customer_amount do
        populationManager:InvalidateSpawnDelay()
        populationManager:TrySpawningCars()
	end
end)

print(modName .. "Successfully loaded version " .. version)
