# Weather Script

This is a custom weather script for FiveM that allows server admins to manually set the weather type (e.g., rain, snow, thunderstorm) for all players on the server. The script uses `ox_lib` for notifications and smooth weather transitions.

---

## Features
- **Manually Set Weather**: Admins can use the `/setweather` command to change the weather.
- **Weather Types**: Supports a variety of weather types, including `CLEAR`, `RAIN`, `SNOW`, `THUNDER`, and more.
- **Notifications**: Notifies all players when the weather changes.
- **Smooth Transitions**: Weather changes are applied smoothly over time.

---

## Requirements
- [ox_lib](https://github.com/overextended/ox_lib)

---

## Installation

1. **Download and Install `ox_lib`**:
   - Download `ox_lib` from its [GitHub repository](https://github.com/overextended/ox_lib).
   - Place the `ox_lib` folder in your server's `resources` directory.
   - Add `ensure ox_lib` to your `server.cfg`.

2. **Add the Weather Script**:
   - Place the `weather-script` folder in your server's `resources` directory.
   - Add `ensure weather-script` to your `server.cfg`.

3. **Configure ACE Permissions**:
   - Add the following lines to your `server.cfg` to restrict the `/setweather` command to admins:
     ```cfg
     add_ace group.admin weather-script.admin allow
     add_principal identifier.steam:YOUR_IDENTIFIER group.admin
     ```
     Replace YOUR`_IDENTIFIER` with your actual identifier (e.g., Steam ID, Discord ID, or license).

---

## Usage

### Commands
1. **Set Weather**:
   - Command: `/setweather [type]`
   - Description: Changes the weather to the specified type.
   - Example:
     ```
     /setweather RAIN
     ```
   - **Permission**: Only players with the `weather-script.admin` ACE permission can use this command.

2. **Check Current Weather**:
   - Command: `/currentweather`
   - Description: Displays the current weather type.
   - Example:
     ```
     /currentweather
     ```

---

## Supported Weather Types
The following weather types are supported and can be configured in `shared/config.lua`:

- `CLEAR`
- `EXTRASUNNY`
- `CLOUDS`
- `OVERCAST`
- `RAIN`
- `CLEARING`
- `THUNDER`
- `SMOG`
- `FOGGY`
- `SNOW`
- `BLIZZARD`
- `SNOWLIGHT`
- `XMAS`

---

## Configuration
The script's configuration can be found in `shared/config.lua`. You can set the default weather type and allowed weather types.

### Example Configuration:
```lua
Config.DefaultWeather = "CLEAR"

Config.AllowedWeatherTypes = {
    "CLEAR",
    "EXTRASUNNY",
    "CLOUDS",
    "OVERCAST",
    "RAIN",
    "CLEARING",
    "THUNDER",
    "SMOG",
    "FOGGY",
    "SNOW",
    "BLIZZARD",
    "SNOWLIGHT",
    "XMAS"
}