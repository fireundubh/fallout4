# Advanced Portable Turret Set Extended

This mod is an extension for [Advanced Portable Turret Set by ccmads](http://www.nexusmods.com/fallout4/mods/8838).

## Requirements

* `AdvPortableTurretSet.esp`
* `AdvPortableTurretSetExt.esp`
* `scripts\dubhAdvTurretScript.pex`

## Scrap/Dismantle/Rig Menu

Activating a placed turret brings up a menu with three options:

Option | Description | Requires
--- | --- | ---
Scrap | Scrap a placed turret anywhere | Robotics Expert I
Dismantle | Return a placed turret to your inventory | Robotics Expert II
Rig | Force a placed turret to self-destruct in 5 seconds | Robotics Expert III

## Recipe Perk Requirements

Recipe | Perk 1 | Perk 2
--- | --- | ---
Portable Blaster Turret | Science IV |
Portable Broadsider Turret | |
Portable Cryolator Turret | Science IV |
Portable Fatman Turret | Gun Nut IV | Science I
Portable Flamer Turret | |
Portable Gamma Turret | Science IV |
Portable Gamma Turret, Lorenzo's Artifact | Science IV |
Portable Gamma Turret, Zeta Wave | Science IV |
Portable Gauss Turret | Science IV |
Portable Laser Turret | Science I |
Portable Laser Turret, Institute | Science III |
Portable Laser Turret, Liberty Prime | Science IV |
Portable Machine Gun Turret | |
Portable Minigun Turret | Gun Nut I |
Portable Missile Turret | Gun Nut IV | Science I
Portable Plasma Turret | Science III |
Portable Railway Spike Turret | |
Portable Shotgun Turret | Gun Nut II |
Portable Spotlight Turret | |

## Changes

### New Features

* New Feature: Added Scrap/Dismantle/Rig menu
* New Feature: Added a Machine Gun Turret (a.k.a. Assault Rifle Turret) with proper barrel model
* New Feature: Added a Shotgun Turret with proper barrel model
* New Feature: Added a Spotlight Turret with proper model
* New Feature: Turrets now explode destructively when destroyed (low damage, medium radius)

### User Interface

* UI: Turret "grenades" now display in inventory as mod boxes
* UI: Ballistic and energy turret recipes now use different icons
* UI: Renamed Mobile Turrets to Portable Turrets
* UI: Renamed Railway Turret to Railway Spike Turret
* UI: Added Cancel button to menu
* UI: Reordered menu: 1. Dismantle, 2. Rig, 3. Scrap, 4. Cancel

### AI

* AI: Turrets now create a loud detection event at the location of each kill

### Gameplay

* Gameplay: Turrets now reward XP for each kill
* Gameplay: When rigged, turrets now self-destruct in 3 seconds
* Gameplay: When spawned, turrets now receive any Heavy Gunner perks you have
* Gameplay: All turrets are now classed as heavy guns so that the Heavy Gunner perks affect them
* Gameplay: All ballistic turrets can stagger targets when spawned with the Heavy Gunner IV perk
* Gameplay: All turrets are now invulnerable to the Ricochet perk, except the Machine Gun Turret

### Crafting

* Crafting: The Scrapper I and Scrapper II perks now affect scrap rewards (common, uncommon, and rare components)
* Crafting: When scrapped, the quantity of each component rewarded now ranges between 1 and 3
* Crafting: Most portable turret recipes now have similar perk requirements to their handheld counterparts
* Crafting: All portable turret recipes now have similar component requirements to their handheld counterparts

### Balance

* Balance: Turret stats aligned with handheld counterparts
* Balance: Turret base damage now properly displayed while in the inventory
* Balance: Turret resistances now improve as you level up
* Balance: Turret durability has been reduced to 30 health
* Balance: Turret durability is now reduced by 5 with each kill

### Fixes

* Fixes: Flamer Turret no longer clones itself when firing
* Fixes: Gamma Turret and Gamma-based turrets now inflict radiation damage, instead of energy damage
* Fixes: Institute Laser Turret now uses the light blue laser beam projectile
* Fixes: Minigun Turret now fires the proper minigun projectile
* Fixes: Railway Spike Turret now staggers targets
* Fixes: Turrets are no longer lootable when destroyed
* Fixes: Turrets now weigh what they actually weigh in your inventory
* Fixes: Turrets can now be dropped from your inventory and will appear as mod boxes

### Other

* Other: Portable turrets no longer count toward your settlement defense rating
* Other: Portable turrets can no longer be hacked with a terminal
* Other: Portable turrets can no longer be powered at a settlement
* Other: Renamed all Editor IDs for clarity (only relevant to modders)

