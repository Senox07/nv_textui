local display = false
local lastDisplay = GetGameTimer() - 5 * 1000

RegisterNetEvent("nv_textui:ShowHelpNotify", function()
    ShowHelpNotify()
end)

function ShowHelpNotify()
    lastDisplay = GetGameTimer()

    if display == false then 
        display = true

        SendNUIMessage({
            action = "show"
        })
        PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    else
        Citizen.SetTimeout(500, function()
            if (GetGameTimer() - lastDisplay) >= 500 then 
                SendNUIMessage({
                    action = "hide"
                })
                display = false
            end
        end)
    end
end

RegisterNetEvent("ShowE", function()
    if display then 
        return 
    end

    SendNUIMessage({
        action = "show"
    })
end)

RegisterNetEvent("HideE", function()
    SendNUIMessage({
        action = "hide"
    })
end)
-- TriggerEvent('nv_textui:ShowHelpNotify', source)