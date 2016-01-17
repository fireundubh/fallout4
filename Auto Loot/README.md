# Auto Loot

* Automatically loots nearby items within a given radius extending outward from the player
* Defaults to off; can be configured by running the Auto Loot Program with the Pip-Boy
* With Filter Mode activated, auto loots specific item types from bodies and/or containers
* With Filter Mode deactivated, auto loots everything from bodies and/or containers
* Which item types are auto looted can be toggled on and off
* Auto loot radius can be changed while in the game
* Does not loot armor or weapons outside bodies and containers

## Future Features

* An option to change the container where auto looted items are stored (e.g., settlements)
* An option to execute single auto loot "burst," where you'd auto loot everything nearby once
* An option to suspend auto loot while in user-defined settlements

## Warning

If you've decorated your settlements with loose items, excluding armor and weapons, you should not be surprised when those items are auto looted.

## Uninstallation and Deactivation

1. Run the Auto Loot Program in the Pip-Boy.
2. Deactivate all modules. If any modules are activated, this option will appear on the main menu.
3. That's it!

## Files

### Required Files

File | Description
--- | ---
`Auto Loot.esp` | A single plugin for all auto loot features
`Auto Loot.bsa` | Contains six scripts (four auto loot effect scripts, a holotape menu script, and a quest script that runs once to add the holotape to the player's inventory)