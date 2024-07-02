function getDateTime()
    if Config.ShowDateAndTime or (Config.ShowOnlyDate and Config.ShowOnlyTime) then
        if Config.DayMonthYear then
            return os.date("%d/%m/%Y %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.MonthDayYear then
            return os.date("%m/%d/%Y %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearMonthDay then
            return os.date("%Y/%m/%d %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearDayMonth then
            return os.date("%Y/%d/%m %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        else
            return os.date("%d/%m/%Y %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        end
    elseif Config.ShowOnlyTime then
        return os.date("%H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
    elseif Config.ShowOnlyDate then
        if Config.DayMonthYear then
            return os.date("%d/%m/%Y", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.MonthDayYear then
            return os.date("%m/%d/%Y", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearMonthDay then
            return os.date("%Y/%m/%d", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearDayMonth then
            return os.date("%Y/%d/%m", os.time() + Config.TimezoneOffset * 60 * 60)
        else
            return os.date("%d/%m/%Y", os.time() + Config.TimezoneOffset * 60 * 60)
        end
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
