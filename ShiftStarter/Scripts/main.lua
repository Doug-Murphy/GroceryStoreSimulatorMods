ExecuteWithDelay(3000, function ()
    local version = "1.0.0"
    print("Loading version " .. version .. " of ShiftStarter.")
	RegisterHook("/Game/BPs/AI/Employees/BP_EmployeeManager.BP_EmployeeManager_C:PostLoadGame", function(self)
		local employeeManager = self:get()

		print("Starting bus arrival")
		employeeManager.IsBusArrivalTime = true
	end)
	print("Successfully loaded version " .. version .. " of ShiftStarter.")
end)
