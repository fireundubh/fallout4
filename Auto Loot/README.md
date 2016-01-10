# Auto Loot

* Automatically loots nearby items within a given radius extending outward from the player
* Does not loot owned items
* Does not loot bodies or containers
* Does not loot everything

## Configurable Radius

Auto Loot Radius can be changed by altering the respective Global Variable in each plugin.

* 4096 units is the default, which is the area of a cell with the player at the center
* Rule: A smaller auto loot radius uses less resources than a larger auto loot radius
* Rule: A smaller auto loot radius is processed faster than a larger auto loot radius
* Rule: 128 units is the height of a normal humanoid actor

## Warning

If you've decorated your settlements with loose ammo, food, drink, drugs, flora, or junk, and installed an auto loot plugin that loots those items, you should not be surprised when you find all of those items in your inventory.

## Uninstallation and Deactivation

1. Using the in-game console, type: `help "auto loot" 4`
2. Find the Form ID of the auto loot quest you want to stop.
3. Using the in-game console, type: `stopquest #` where `#` is the Form ID of the auto loot quest you want to stop.
4. When you stop an auto loot quest, the associated perk is removed from the player and the auto loot effect ends.
5. If uninstalling, save and quit, and then remove the appropriate plugin from your load order.

## Files

### Required Files

File | Description
--- | ---
`Auto Loot.bsa` | Contains the two scripts that power all of these plugins

### Optional Plugins

File | Description
--- | ---
`Auto Loot - Ammo.esp` | Automatically loots nearby ammo
`Auto Loot - Consumables.esp` | Automatically loots nearby food, drink, and drugs
`Auto Loot - Flora.esp` | Automatically loots nearby flora, excluding Irradiated Thistle, which is a trap
`Auto Loot - Junk.esp` | Automatically loots nearby junk items, excluding some items
`Auto Loot - Valuables.esp` | Automatically loots nearby valuables

### Loose Files

These files are only needed when `Auto Loot.bsa` is absent.

File | Description
--- | ---
`scripts\dubhAutoLootEffect.pex` | Auto loot effect script compiled with Caprica
`scripts\dubhAutoLootQuest.pex` | Auto loot quest script compiled with Caprica

These are the source scripts, and are only needed if you want to modify and compile them yourself.

File | Description
--- | ---
`scripts\source\dubhAutoLootEffect.psc` | Auto loot effect script source
`scripts\source\dubhAutoLootQuest.psc` | Auto loot quest script source

## Table: Auto Loot - Valuables

These are the items covered by the Auto Loot - Valuables plugin.

Object | Editor ID | Form ID
--- | --- | ---
`Bottlecap` | `Caps001` | `[MISC:0000000F]`
`Caps Stash` | `loot_capsStash_tin` | `[ACTI:0003000C]`
`Caps` | `BottleCapMinePlacedCaps` | `[ACTI:002472ED]`
`Caps` | `MoneyShotPlacedCaps` | `[ACTI:0020ABE3]`
`Duct Tape` | `DuctTape01` | `[MISC:0004D1F2]`
`Economy Wonderglue` | `WonderglueLarge` | `[MISC:0006C5AE]`
`Enhanced Targeting Card` | `ChipBoard_Chip` | `[MISC:000E7E71]`
`Fancy Hairbrush` | `Hairbrush_02_Silver` | `[MISC:00060ECD]`
`Gold Plated Flip Lighter` | `LighterGoldPlated` | `[MISC:00060E88]`
`Gold Watch` | `WatchGold` | `[MISC:00060E7C]`
`Microscope` | `Microscope` | `[MISC:00059AEB]`
`Military Grade Duct Tape` | `DuctTapeMilitary` | `[MISC:00060E78]`
`Pack of Duct Tape` | `DuctTape01_Rare` | `[MISC:001C7F1F]`
`Sealed Wonderglue` | `Wonderglue_PreWar` | `[MISC:000E3784]`
`Silver Bowl` | `Bowl_05_Silver` | `[MISC:00060EDB]`
`Silver Fork` | `Fork_03_Silver` | `[MISC:00060E8B]`
`Silver Locket` | `SilverLocket` | `[MISC:00059B34]`
`Silver Plate` | `Plate_03_Silver` | `[MISC:00060E91]`
`Silver Pocket Watch` | `WatchSilver` | `[MISC:00060E7D]`
`Silver Table Knife` | `Knife_03_Silver` | `[MISC:00060E8D]`
`Silver Table Spoon` | `Spoon_03_Silver` | `[MISC:00060E95]`
`Vegetable Starch` | `VegetableStarch` | `[MISC:000657FE]`
`Wonderglue` | `Wonderglue` | `[MISC:00059B25]`