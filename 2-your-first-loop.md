# 2. Your first game loop

## Points to review

- There are special functions that PICO-8 calls if they exist in the loaded program: `_init`, `_update`, `_update60`, `_draw`
- Use `_draw` for updating the graphics, regardless of game state
- `cls` for clearing the screen
- `print` for drawing text on the screen
- Use `_update` or `_update60` functions for the game loop
- Run currently loaded cartridge with `ctrl+r`
- Save changes to current cartridge with `ctrl+s`
