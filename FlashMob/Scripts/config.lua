local config = {
    --The maximum amount of customers you want in your flash mob. When flash mob is initiated, it will spawn customers until this amount is reached.
    MaxCustomerAmount = 50,

    -- Modifier keys that need to be pressed with the key to initiate the flash mob.
    modifier_keys = { ModifierKey.CONTROL },
    -- Key that needs to be pressed with the modifier keys to initiate the flash mob.
    key = Key.F4
}

return config
