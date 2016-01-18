ScriptName dubhAutoLootHolotape Extends Terminal Hidden

GlobalVariable Property dubhAutoLootAll Auto

GlobalVariable Property dubhAutoLootRadius Auto

Formlist Property dubhAutoLootPerks Auto
{
	dubhAutoLootPerks.GetAt(0) ; Ammo
	dubhAutoLootPerks.GetAt(1) ; Bodies
	dubhAutoLootPerks.GetAt(2) ; Containers
	dubhAutoLootPerks.GetAt(3) ; Drink
	dubhAutoLootPerks.GetAt(4) ; Flora
	dubhAutoLootPerks.GetAt(5) ; Food
	dubhAutoLootPerks.GetAt(6) ; Junk
	dubhAutoLootPerks.GetAt(7) ; Meds
	dubhAutoLootPerks.GetAt(8) ; Valuables
}

Function ToggleBool(GlobalVariable akGlobal)
	If akGlobal.GetValue() == 0
		akGlobal.SetValue(1)
	Else
		akGlobal.SetValue(0)
	EndIf
EndFunction

Function TogglePerk(Perk akPerk, Actor akActor, Bool abNotify)
	If akActor.HasPerk(akPerk)
		akActor.RemovePerk(akPerk)
	Else
		akActor.AddPerk(akPerk, abNotify)
	EndIf
EndFunction

; =============================================================================
; Last Fragment: 20
; =============================================================================

; Remove all perks
; -----------------------------------------------------------------------------
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
	Actor Player = Game.GetPlayer()
	Int i = 0
	While i < dubhAutoLootPerks.GetSize()
		Perk PerkForm = dubhAutoLootPerks.GetAt(i) as Perk
		If Player.HasPerk(PerkForm)
			Player.RemovePerk(PerkForm)
		EndIf
		i += 1
	EndWhile
EndFunction

; Toggle auto loot perks
; -----------------------------------------------------------------------------
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(0) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_03(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(1) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_04(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(2) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_05(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(3) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_06(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(4) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_07(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(5) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_08(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(6) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_09(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(7) as Perk, Game.GetPlayer(), False)
EndFunction

Function Fragment_Terminal_10(ObjectReference akTerminalRef)
	TogglePerk(dubhAutoLootPerks.GetAt(8) as Perk, Game.GetPlayer(), False)
EndFunction

; Control auto loot radius
; -----------------------------------------------------------------------------
Function Fragment_Terminal_20(ObjectReference akTerminalRef)
	dubhAutoLootRadius.SetValue(8192.0)
EndFunction

Function Fragment_Terminal_11(ObjectReference akTerminalRef)
	dubhAutoLootRadius.SetValue(4096.0)
EndFunction

Function Fragment_Terminal_12(ObjectReference akTerminalRef)
	dubhAutoLootRadius.SetValue(2048.0)
EndFunction

Function Fragment_Terminal_13(ObjectReference akTerminalRef)
	dubhAutoLootRadius.SetValue(1024.0)
EndFunction

Function Fragment_Terminal_14(ObjectReference akTerminalRef)
	dubhAutoLootRadius.SetValue(512.0)
EndFunction

Function Fragment_Terminal_15(ObjectReference akTerminalRef)
	dubhAutoLootRadius.SetValue(256.0)
EndFunction

; Toggle whether all items are removed from bodies and containers
; -----------------------------------------------------------------------------
Function Fragment_Terminal_16(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootAll)
EndFunction

; Cast loot everything once by chaining together spells
; -----------------------------------------------------------------------------
Function Fragment_Terminal_17(ObjectReference akTerminalRef)
; TODO: Create SPEL/MGEF pairs and scripts for single casts
EndFunction

; Change container where auto looted items are stored
; -----------------------------------------------------------------------------
Function Fragment_Terminal_18(ObjectReference akTerminalRef)
; TODO: Where would this ObjectReference be stored? I'd guess a formlist?
EndFunction

; Suspend auto looting while in a specific settlement
; -----------------------------------------------------------------------------
Function Fragment_Terminal_19(ObjectReference akTerminalRef)
; TODO: Find nearby workshop location and add to formlist
EndFunction

