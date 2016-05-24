;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_dubhAutoLootMenuFilters_010026F1 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(0) as Perk
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
Perk kPerk = dubhAutoLootPerks.GetAt(0) as Perk
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
Perk kPerk = dubhAutoLootPerks.GetAt(3) as Perk
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
Perk kPerk = dubhAutoLootPerks.GetAt(3) as Perk
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
Perk kPerk = dubhAutoLootPerks.GetAt(5) as Perk
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
Perk kPerk = dubhAutoLootPerks.GetAt(5) as Perk
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
Perk kPerk = dubhAutoLootPerks.GetAt(6) as Perk
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
Perk kPerk = dubhAutoLootPerks.GetAt(6) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(7) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_10
Function Fragment_Terminal_10(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(7) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(9) as Perk
If kPlayer.HasPerk(kPerk)
	kPlayer.RemovePerk(kPerk)
Else
	kPlayer.AddPerk(kPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_12
Function Fragment_Terminal_12(ObjectReference akTerminalRef)
;BEGIN CODE
Actor kPlayer = Game.GetPlayer()
Perk kPerk = dubhAutoLootPerks.GetAt(9) as Perk
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
