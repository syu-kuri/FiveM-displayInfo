function getDateTime()
    if Config.ShowDateAndTime then
        return os.date(Config.DateAndTimeFormat, os.time() + Config.TimezoneOffset * 60 * 60)
    else
        print('ShowDateAndTime or Config.ShowOnlyDate or Config.ShowOnlyTime must be true.')
        return os.date("%d/%m/%Y %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
    end
end


Citizen.CreateThread(function()
    while true do
        TriggerClientEvent('displayInfo', -1, getDateTime())
        Wait(30000)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Wait(2500)
        TriggerClientEvent('displayInfo', -1, getDateTime())
    end
end)

AddEventHandler("playerJoining", function (data)
    TriggerClientEvent('displayInfo', source, getDateTime())
end)
