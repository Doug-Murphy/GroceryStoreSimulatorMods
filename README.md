# Introduction
This repo contains a collection of mods that I have made for the game Grocery Store Simulator.

# Mods

## Box Destroyer
This mod aims to make box cleanup a breeze! Any empty boxes lying on the ground will be deleted when you press Ctrl + F7. Empty boxes on storage shelves will not be deleted.

The keybind is configurable in the config.lua file similar to other mods.

### Known Issues/Future Work
- If any player is carrying an empty box, the box is deleted and that player will be unable to pick anything else up until they leave and rejoin the session.
- If the player executing the box deletion is carrying something, the process is aborted. This is in an effort to reduce the chance of entering the bugged state as mentioned above.

# Contributing

Please feel free to fork and open PR's for any bugfixes or feature additions that you'd like to make! Not a coder? No problem! Open up an issue and let's talk about it!