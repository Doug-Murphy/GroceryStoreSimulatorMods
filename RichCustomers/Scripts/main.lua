local config = require "config"

local version = "1.0.0"
local modName = "[RichCustomers] "

print(modName .. "Loading version " .. version)

NotifyOnNewObject("/Game/BPs/AI/BP_Customer.BP_Customer_C", function ()
    local customers = FindAllOf("BP_Customer_C")

    for i = 1, #customers do
        local customer = customers[i]
        local customerId = GetActorId(customer)

        if customer.OverpricedRatio ~= config.max_acceptable_cost_multiplier then
            customer.OverpricedRatio = config.max_acceptable_cost_multiplier
            print(modName .. "Successfully set customer " .. customerId .. " overpriced ratio to " .. tostring(customer.OverpricedRatio))
        end
    end
end)

function GetActorId(actor)
	if not actor:IsValid() then
        print(modName .. "Actor is not valid. Cannot get the identifier.")
    end

	return actor:GetFullName()
end

print(modName .. "Successfully loaded version " .. version)
