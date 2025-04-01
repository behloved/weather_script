local currentWeather = Config.DefaultWeather

-- Event to update the weather
RegisterNetEvent('weather-script:updateWeather', function(weatherType)
    currentWeather = weatherType
    SetWeatherTypeOverTime(currentWeather, 15.0) -- Smooth transition over 15 seconds
    Wait(15000) -- Wait for the transition to complete
    SetWeatherTypeNow(currentWeather)
    SetWeatherTypePersist(currentWeather)
    print("Weather updated to:", currentWeather)
end)

-- Command to check the current weather
RegisterCommand('currentweather', function()
    lib.notify({
        title = 'Current Weather',
        description = 'The current weather is ' .. currentWeather,
        type = 'info'
    })
end, false)