ExecuteWithDelay(3000, function ()
    local version = "1.0.0"
    local modName = "[ShiftStarter] "

    print(modName .. "Loading version " .. version)
	RegisterHook("/Game/BPs/AI/Employees/BP_EmployeeManager.BP_EmployeeManager_C:PostLoadGame", function(self)
		local employeeManager = self:get()

		print(modName .. "Starting bus arrival")
		employeeManager.IsBusArrivalTime = true
	end)

	print(modName .. "Successfully loaded version " .. version)
end)
