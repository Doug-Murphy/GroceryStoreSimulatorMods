local config = require "config"

local version = "1.0.0"
print("Loading version " .. version .. " of RichCustomers.")

NotifyOnNewObject("/Game/BPs/AI/BP_Customer.BP_Customer_C", function ()
    local customers = FindAllOf("BP_Customer_C")

    for i = 1, #customers do
        local customer = customers[i]
        local customerId = GetActorId(customer)

        if customer.OverpricedRatio ~= config.MaximumAcceptableCostMultiplier then
            customer.OverpricedRatio = config.MaximumAcceptableCostMultiplier
            print("Successfully set customer " .. customerId .. " overpriced ratio to " .. tostring(customer.OverpricedRatio))
        end
    end
end)

function GetActorId(actor)
	if not actor:IsValid() then
        print("Actor is not valid. Cannot get the identifier.")
    end

	return actor:GetFullName()
end

print("Successfully loaded version " .. version .. " of RichCustomers.")
