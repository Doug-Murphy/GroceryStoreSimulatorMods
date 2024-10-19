local config = {
    --@description The multiplier amount of the base price of an item that a customer is still willing to pay for it
    --@description Example: A multiplier of 100 with a base price of 2.99 means the customer will buy it so long as the price is 299.00 or less
    --@type int
    --@default 100
    max_acceptable_cost_multiplier = 100
}
return config
