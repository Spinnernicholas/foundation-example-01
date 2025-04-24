# Simple Example Mod | LuaCATS

This is a simple example mod for Foundation, demonstrating how to add new buildings, resources, events, and behavior trees using Lua.

## Features

- **New Building:** Adds a decorative Fountain building.
- **New Resource:** Introduces "Asteroid Rock" as a luxury trade resource.
- **Custom Events & Quests:** Includes a quest and event triggered by building a lumber camp.
- **Custom Trading Village:** Adds a new trading village (Avignon) that trades Asteroid Rock.
- **Behavior Tree Example:** Demonstrates custom guard locator logic for soldiers.
- **Localization:** English, French, and Klingon translations included.

## File Structure

- `mod.lua` - Main entry point, registers assets and loads scripts.
- `meta.lua` - Enum/type definitions for assets.
- `src/` - Lua scripts for buildings, events, balancing, and behavior trees.
- `models/` - 3D models and textures.
- `icons/` - Custom icon(s) for resources.
- `localization/` - Translation files for supported languages.
- `generated_ids.lua` - Auto-generated asset IDs (do not edit manually).
- `mod.json` - Mod metadata.

## Installation

1. Copy the entire `foundation-example-01` folder into your Foundation `mods` directory.
2. Launch Foundation and enable the mod in the Mods menu.

## Setting up VSCode with LuaCATS Meta Library

To get full IntelliSense and type checking in VSCode for Foundation modding, you can use the [polymorph-foundation](https://github.com/Spinnernicholas/polymorph-foundation) LuaCATS meta library.

1. **Clone the Meta Library:**

   ```sh
   git clone https://github.com/Spinnernicholas/polymorph-foundation ~/luacats/polymorph-foundation
   ```

   Replace `~/luacats/polymorph-foundation` with your preferred central location.

2. **Configure the VSCode Lua Extension:**

   - Open your mod workspace in VSCode.
   - Go to `File` > `Preferences` > `Settings` (or press `Ctrl+,`).
   - Search for `Lua: Workspace Library`.
   - Add the path to your cloned meta library (e.g., `/home/youruser/luacats/polymorph-foundation` or `C:\Users\youruser\luacats\polymorph-foundation`) to the list of workspace libraries.

   Alternatively, add the following to your `.vscode/settings.json`:

   ```json
   {
     "Lua.workspace.library": [
       "/absolute/path/to/luacats/polymorph-foundation"
     ]
   }
   ```

   Adjust the path as needed for your system.

3. **Reload VSCode:**

   - Restart VSCode or reload the window for the changes to take effect.

You should now have auto-completion and type checking for Foundation's Lua API in your mod scripts.

## Credits

- Original mod by Leo
- Updated and documented by Spinnernicholas

## License

For educational and demonstration purposes.