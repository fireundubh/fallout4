;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_dubhAutoLootMenuFilters_010026F2 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(1) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(1) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(2) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(2) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(4) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(4) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(8) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(8) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhAutoLootGlobals Auto Const
Formlist Property dubhAutoLootPerks Auto Const
