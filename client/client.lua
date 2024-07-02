RegisterNetEvent('displayInfo')
AddEventHandler('displayInfo', function(time)
    if Config.ShowServerName and Config.ServerName then
        time = time .." | © " .. Config.ServerName
    end
    if Config.ShowPlayerName then
        time = time .. "\n" .. Config.PlayerName .. ": " .. GetPlayerName(NetworkGetEntityOwner(PlayerPedId()))
    end
    if Config.ShowPlayerID then
        time = time .. "\n" .. Config.PlayerID .. ": " .. GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))
    end
    SendNUIMessage({
        action = "setDisplayInfo",
        time = time
    })
end)
