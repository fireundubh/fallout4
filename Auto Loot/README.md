# Auto Loot

## Features

* Automatically loot Ammo, Bodies, Containers, Drink, Flora, Food, Meds, and Valuables.
* Automatically deliver loot to any settlement, or add them to your inventory.

### Configurable

* Receive the Auto Loot Program when you pick up the Pip-Boy, or when you first load the mod into an existing save.
* Run the Auto Loot Program (Misc. Item\Holotape) in your Pip-Boy to configure auto loot.
* Radius Control: Control the distance at which items, bodies, containers, and flora are auto looted.
* Modules Setup: Toggle all auto loot modules at will, including Ammo, Drink, Flora, Food, Meds, and Valuables.
* Container Setup: Choose from the Player and 30 destinations to send your loot.
* Advanced Setup: Toggle Auto Steal to auto loot, or ignore, owned items.

### Filter Mode

* With Filter Mode activated, auto loot only user-defined items from bodies and containers.
* With Filter Mode deactivated (default), auto loot all items from bodies and containers.

### Auto Steal

* With Auto Steal activated, auto loot owned items.
* With Auto Steal deactivated (default), auto loot only unowned items.

## In-game Performance Tweaks

If you need to adjust the rate at which items are auto looted, use the following console commands:

> set dubhAutoLootDelayGeneral to 0.0

> set dubhAutoLootDelayBodies to 0.0

> set dubhAutoLootDelayContainers to 0.0

> set dubhAutoLootDelayFlora to 0.0

Replace `0.0` with your preferred delay duration in seconds.

Higher values may increase reliability while lower values will increase the auto loot rate.

## Recommendations

I highly recommend installing [Faster Terminals](https://github.com/fireundubh/fo4-mods/tree/master/Faster%20Terminals) alongside Auto Loot; otherwise, you'll have to put up with the slow holotape display rate.

## Download/Installation

1. [Download the master archive](https://github.com/fireundubh/fo4-mods/archive/master.zip) which contains all of my mods.
2. Extract the contents of the `Auto Loot` folder to your game's `Data` directory.
3. Use a mod manager to activate the plugin, or add `Auto Loot.esp` to `%LocalAppData%\Fallout4\plugins.txt`.
4. There are no compatibility issues, so you don't have to worry about load order.

**Important:** The following setting must be in `Fallout4.ini` for most mods to work properly:

```
[Archive]
bInvalidateOlderFiles=1
```

You can find `Fallout4.ini` in the `%UserProfile%\My Documents\My Games\Fallout4` directory.

## Future Features

* HIGHEST PRIORITY: An option to auto scrap nearby objects while in workshop mode
* VERY LOW PRIORITY: An option to execute single auto loot "burst," where you'd auto loot everything nearby once
* VERY LOW PRIORITY: An option to suspend auto loot while in user-defined settlements

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
`scripts\dubhAutoLootEffectScript.pex` | ActiveMagicEffect script for most auto looted objects
`scripts\dubhAutoLootEffectBodiesScript.pex` | ActiveMagicEffect script for bodies
`scripts\dubhAutoLootEffectContainersScript.pex` | ActiveMagicEffect script for containers
`scripts\dubhAutoLootEffectFloraScript.pex` | ActiveMagicEffect script for flora
`scripts\dubhAutoLootHolotapeScript.pex` | Terminal script for holotape menu
`scripts\dubhAutoLootQuestScript.pex` | Quest script for adding holotape item to player's inventory