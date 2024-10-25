local version = "1.0.0"
local modName = "[CheckoutToggler] "

print(modName .. "Loading version " .. version)
local config = require "config"

--Much of the GetTargetedActor code was taken from the LineTraceMod that is bundled with UE4SS.
--I modified it to remove unnecessary things and tailor it to the purpose of this mod.
local UEHelpers = require("UEHelpers")
local GetKismetSystemLibrary = UEHelpers.GetKismetSystemLibrary
local GetKismetMathLibrary = UEHelpers.GetKismetMathLibrary
local GetPlayerController = UEHelpers.GetPlayerController

local function GetTargetedActor()
    local PlayerController = GetPlayerController()
    local CameraManager = PlayerController.PlayerCameraManager
    local StartVector = CameraManager:GetCameraLocation()
    local AddValue = GetKismetMathLibrary():Multiply_VectorInt(GetKismetMathLibrary():GetForwardVector(CameraManager:GetCameraRotation()), 50000.0)
    local EndVector = GetKismetMathLibrary():Add_VectorVector(StartVector, AddValue)
    local HitResult = {}
    local WasHit = GetKismetSystemLibrary():LineTraceSingle(
        PlayerController.Pawn,
        StartVector,
        EndVector,
        0,
        false,
        {},
        0,
        HitResult,
        true,
        {},
        {},
        0.0
    )

    if WasHit then
        if UnrealVersion:IsBelow(5, 0) then
            return HitResult.Actor:Get()
        else
            return HitResult.HitObjectHandle.Actor:Get()
        end
    end
end

function ToggleTargetedCheckout()
    local targetedActor = GetTargetedActor()

    if targetedActor:IsA("/Game/BPs/Checkout/BP_CheckoutCounter.BP_CheckoutCounter_C") then
        local previousOnState = targetedActor.IsCheckoutOn
        local desiredState = not previousOnState
        targetedActor:SERVER_SetCheckoutOn(desiredState)
        print(modName .. "Toggled " .. targetedActor:GetFullName() .. " on state to " .. tostring(desiredState))
    elseif targetedActor:IsA("/Game/BPs/SelfCheckout/BP_SelfCheckout.BP_SelfCheckout_C") then
        local previousOnState = targetedActor.IsOn
        local desiredState = not previousOnState
        targetedActor:SERVER_SetCheckoutOn(desiredState)
        print(modName .. "Toggled " .. targetedActor:GetFullName() .. " on state to " .. tostring(desiredState))
    end
end

RegisterKeyBind(config.key, config.modifier_keys, ToggleTargetedCheckout)

print(modName .. "Successfully loaded version " .. version)
