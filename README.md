# Introduction
This repo contains a collection of mods that I have made for the game Grocery Store Simulator.

# Mods

## Box Destroyer
This mod aims to make box cleanup a breeze! Any empty boxes lying on the ground will be deleted when you press Ctrl + F7. Empty boxes on storage shelves will not be deleted.

If the player executing the box deletion is carrying an empty box, the process is aborted. This avoids an issue where if a carried item is destroyed, then the player will not be able to pick up any other items until they leave and rejoin the session.

The keybind is configurable in the config.lua file similar to other mods.

## Shift Starter
How many times have you loaded your game _right_ after a shift starts and you have to run the store by yourself until the next shift begins? That's no fun! You hired those employees for them to work during their shift, no questions asked and no thanks given! With this mod, no matter what time it is when you load your game the bus will arrive bringing you your employees!

### Known Issues/Future Work
- If a player who is not the player executing the box deletion is carrying an empty box, the box is deleted and that player will be unable to pick anything else up until they leave and rejoin the session.

# Contributing

Please feel free to fork and open PR's for any bugfixes or feature additions that you'd like to make! Not a coder? No problem! Open up an issue and let's talk about it!