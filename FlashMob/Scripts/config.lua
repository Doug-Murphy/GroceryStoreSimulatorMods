local config = {
    --@description The maximum amount of customers you want in your flash mob. When flash mob is initiated, it will spawn customers until this amount is reached.
    --@type int
    --@default 50
    max_customer_amount = 50,
    --@description Modifier keys that need to be pressed with the key set below
    --@type list[ModifierKey]
    --@default { ModifierKey.CONTROL }
    modifier_keys = { ModifierKey.CONTROL },
    --@description Key to delete all empty boxes
    --@type Key
    --@default Key.F4
    key = Key.F4
}
return config
