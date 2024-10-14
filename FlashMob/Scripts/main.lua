local config = require "config"

local version = "1.0.0"
print("Loading version " .. version .. " of FlashMob.")

RegisterKeyBind(config.key, config.modifier_keys, function()
    print("Starting flash mob!")
    local populationManager = FindFirstOf("BP_PopulationManager_C")

	if populationManager == nil or not populationManager:IsValid() then
		print("Could not find BP_PopulationManager_C or it is not valid.")
		return
	end

	if not populationManager:CanSpawn() then
        print("Unable to spawn customers. Is your store currently open?")
        return
	end

	populationManager.MaxCustomerCount = config.MaxCustomerAmount
	print("Set max customers count to " .. tostring(config.MaxCustomerAmount))

	if (config.MaxCustomerAmount == populationManager.CurrentCustomerCount) then
	    print("You currently have the maximum amount of customers that you set in your config. Cannot spawn any customers.")
	    return
	end

	print("Current customer count is " .. tostring(populationManager.CurrentCustomerCount) .. ". Spawning " .. tostring(config.MaxCustomerAmount - populationManager.CurrentCustomerCount) .. " customers now.")

    --Calling TrySpawningCars() WITHOUT also calling InvalidateSpawnDelay does not crash after saving. If both are called, the game crashes after saving.
    --However, without calling InvalidSpawnDelay(), then TrySpawningCars() does nothing because the delay has not elapsed in order for a car to spawn.
	for i = populationManager.CurrentCustomerCount, config.MaxCustomerAmount do
        populationManager:InvalidateSpawnDelay()
        populationManager:TrySpawningCars()
	end
end)

print("Successfully loaded version " .. version .. " of FlashMob.")
