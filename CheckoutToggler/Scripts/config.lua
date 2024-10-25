local config = {
    --@description Modifier keys that need to be pressed with the key set below
    --@type list[ModifierKey]
    --@default { ModifierKey.CONTROL }
    modifier_keys = { ModifierKey.CONTROL },
    --@description Key to delete all empty boxes
    --@type Key
    --@default Key.C
    key = Key.C
}
return config