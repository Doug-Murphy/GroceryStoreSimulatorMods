# Introduction
This repo contains a collection of mods that I have made for the game Grocery Store Simulator.

# Mods

## Better Self Checkout
Meet Better Self Checkout: Your ultimate solution for smoother self-service! No more interruptions or frantic calls for 
assistance. With this mod, all self-checkout errors are automatically resolved, ensuring a seamless shopping experience 
for you and your customers every time. Happy shopping!

## Box Destroyer
This mod aims to make box cleanup a breeze! Any empty boxes lying on the ground will be deleted when you press Ctrl + F7. 
Empty boxes placed on storage shelves or being held by you/an employee will not be deleted.

The keybind is configurable in the config.lua file similar to other mods.

### Known Issues/Future Work
- If a player who is not the player executing the box deletion is carrying an empty box, the box is deleted and that 
player will be unable to pick anything else up until they leave and rejoin the session.

## Flash Mob
Ever felt like your grocery store was just a bit too peaceful? Introducing the Flash Mob mod! With a simple press of 
Ctrl + F4, watch as a horde of eager shoppers flood your aisles, ready to grab every last can of beans and loaf of bread. 
Whether you want a cozy crowd or a full-blown shopping frenzy, you control the chaos with a configurable customer count. 
Perfect for those moments when you need a little extra excitement in your store management life. Just be sure to keep an 
eye on the checkout lines!

### Known Issues/Future Work
- Upon leaving your session, _after_ your game saves, the game may crash! :) I have no idea how to fix this. Rest assured 
though that the save is completed, so no progress is lost.

## Rich Customers
Have you ever gotten frustrated with how frugal your customers are? Don't you want to just be a fat cat grocery store 
mogul with no regard for the basic requirements of living for the peasants of the world? Well now you can be! This mod 
makes all of your customers super rich and no longer worry about the price of your goods.

The maximum acceptable amount multiplier of the base cost is configurable with a default of 100x.

## Shift Starter
How many times have you loaded your game _right_ after a shift starts and you have to run the store by yourself until 
the next shift begins? That's no fun! You hired those employees for them to work during their shift, no questions asked 
and no thanks given! With this mod, no matter what time it is when you load your game the bus will arrive bringing you 
your employees!

# Contributing

Please feel free to fork and open PR's for any bugfixes or feature additions that you'd like to make! Not a coder? No 
problem! Open up an issue and let's talk about it!
