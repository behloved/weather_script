local currentWeather = Config.DefaultWeather

-- Function to set the weather
local function setWeather(weatherType)
    if not weatherType or not table.contains(Config.AllowedWeatherTypes, weatherType) then
        print("Invalid weather type:", weatherType)
        return false
    end

    currentWeather = weatherType
    TriggerClientEvent('weather-script:updateWeather', -1, currentWeather)
    print("Weather changed to:", currentWeather)
    return true
end

-- Command to change the weather
RegisterCommand('setweather', function(source, args)
    local src = source
    if src > 0 and not IsPlayerAceAllowed(src, "weather-script.admin") then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Access Denied',
            description = 'You do not have permission to use this command.',
            type = 'error'
        })
        return
    end

    local weatherType = args[1] and args[1]:upper()
    if setWeather(weatherType) then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Weather Changed',
            description = 'Weather has been updated to ' .. weatherType,
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Invalid Weather',
            description = 'The specified weather type is not valid.',
            type = 'error'
        })
    end
end, false)

-- Utility function to check if a value exists in a table
function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end