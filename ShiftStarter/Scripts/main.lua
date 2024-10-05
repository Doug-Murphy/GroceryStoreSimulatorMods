ExecuteWithDelay(3000, function ()
	RegisterHook("/Game/BPs/AI/Employees/BP_EmployeeManager.BP_EmployeeManager_C:PostLoadGame", function(self)
		local employeeManager = self:get()
		
		print("Starting bus arrival")
		employeeManager.IsBusArrivalTime = true
	end)
end)