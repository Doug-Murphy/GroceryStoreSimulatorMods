ExecuteWithDelay(3000, function ()
    local version = "1.0.0"
    local modName = "[BetterSelfCheckout] "

    print(modName .. "Loading version " .. version)
    RegisterHook("/Game/BPs/SelfCheckout/BP_SelfCheckout.BP_SelfCheckout_C:OnRep_bError", function(self)
        --NOTE: This method is also called when a customer exits the self checkout.
        --It seems that upon exiting self checkout, the game does a sort of "reset" of the machine, which triggers this.
        --The bError property is false when this happens. 
        local selfCheckout = self:get()

        if selfCheckout.bError == true then
            print(modName .. "Self checkout error! Auto-fixing it now!")
            ExecuteWithDelay(500, function()
                --This does not seem to work without a delay. Not sure why that is.
                --Perhaps some background processing happens in the game's internal code.
                --In that case, hopefully 500ms is always a sufficient amount of time.
                selfCheckout.bError = false
                print(modName .. "bError value was set to " .. tostring(selfCheckout.bError))
                selfCheckout:SERVER_SetShowError(false)
                print(modName .. "Finished calling SERVER_SetShowError with false")
            end)
        end
    end)

	print(modName .. "Successfully loaded version " .. version)
end)
