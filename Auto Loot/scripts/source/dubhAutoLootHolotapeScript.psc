ScriptName dubhAutoLootHolotapeScript Extends Terminal Hidden

; -----------------------------------------------------------------------------
; FRAGMENTS
; -----------------------------------------------------------------------------

; Remove all perks
; -----------------------------------------------------------------------------
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
	Actor Player = Game.GetPlayer()
	Int i = 0
	While i < dubhAutoLootPerks.GetSize()
		Perk PerkForm = dubhAutoLootPerks.GetAt(i) as Perk
		If Player.HasPerk(PerkForm)
			Player.RemovePerk(PerkForm)
			Log(PerkForm + " was removed from " + Player)
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
	SetGlobalByIndexF(1, 8192.0)
EndFunction

Function Fragment_Terminal_11(ObjectReference akTerminalRef)
	SetGlobalByIndexF(1, 4096.0)
EndFunction

Function Fragment_Terminal_12(ObjectReference akTerminalRef)
	SetGlobalByIndexF(1, 2048.0)
EndFunction

Function Fragment_Terminal_13(ObjectReference akTerminalRef)
	SetGlobalByIndexF(1, 1024.0)
EndFunction

Function Fragment_Terminal_14(ObjectReference akTerminalRef)
	SetGlobalByIndexF(1, 512.0)
EndFunction

Function Fragment_Terminal_15(ObjectReference akTerminalRef)
	SetGlobalByIndexF(1, 256.0)
EndFunction

; Toggle whether all items are removed from bodies and containers
; -----------------------------------------------------------------------------
Function Fragment_Terminal_16(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(0) as GlobalVariable)
EndFunction

; Toggle owned item filter - TRUE: don't loot owned items, FALSE: loot all items
; -----------------------------------------------------------------------------
Function Fragment_Terminal_17(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(2) as GlobalVariable)
EndFunction

; Rotate delays by 0.1s
; -----------------------------------------------------------------------------
Function Fragment_Terminal_18(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootGlobalVariables.GetAt(3) as GlobalVariable)
EndFunction

Function Fragment_Terminal_19(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootGlobalVariables.GetAt(4) as GlobalVariable)
EndFunction

Function Fragment_Terminal_21(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootGlobalVariables.GetAt(5) as GlobalVariable)
EndFunction

Function Fragment_Terminal_22(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootGlobalVariables.GetAt(6) as GlobalVariable)
EndFunction

Function Fragment_Terminal_23(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(8) as GlobalVariable)
EndFunction

; Always send to player
; -----------------------------------------------------------------------------

Function Fragment_Terminal_24(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(9) as GlobalVariable)		; ammo
EndFunction

Function Fragment_Terminal_25(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(10) as GlobalVariable)		; bodies
EndFunction

Function Fragment_Terminal_26(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(11) as GlobalVariable)		; containers
EndFunction

Function Fragment_Terminal_27(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(12) as GlobalVariable)		; drink
EndFunction

Function Fragment_Terminal_28(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(13) as GlobalVariable)		; flora
EndFunction

Function Fragment_Terminal_29(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(14) as GlobalVariable)		; food
EndFunction

Function Fragment_Terminal_30(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(15) as GlobalVariable)		; junk
EndFunction

Function Fragment_Terminal_31(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(16) as GlobalVariable)		; meds
EndFunction

Function Fragment_Terminal_32(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootGlobalVariables.GetAt(17) as GlobalVariable)		; valuables
EndFunction

; Set container value
; -----------------------------------------------------------------------------
Function Fragment_Terminal_70(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 0)
EndFunction

Function Fragment_Terminal_71(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 1)
EndFunction

Function Fragment_Terminal_72(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 2)
EndFunction

Function Fragment_Terminal_73(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 3)
EndFunction

Function Fragment_Terminal_74(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 4)
EndFunction

Function Fragment_Terminal_75(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 5)
EndFunction

Function Fragment_Terminal_76(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 6)
EndFunction

Function Fragment_Terminal_77(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 7)
EndFunction

Function Fragment_Terminal_78(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 8)
EndFunction

Function Fragment_Terminal_79(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 9)
EndFunction

Function Fragment_Terminal_80(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 10)
EndFunction

Function Fragment_Terminal_81(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 11)
EndFunction

Function Fragment_Terminal_82(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 12)
EndFunction

Function Fragment_Terminal_83(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 13)
EndFunction

Function Fragment_Terminal_84(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 14)
EndFunction

Function Fragment_Terminal_85(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 15)
EndFunction

Function Fragment_Terminal_86(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 16)
EndFunction

Function Fragment_Terminal_87(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 17)
EndFunction

Function Fragment_Terminal_88(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 18)
EndFunction

Function Fragment_Terminal_89(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 19)
EndFunction

Function Fragment_Terminal_90(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 20)
EndFunction

Function Fragment_Terminal_91(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 21)
EndFunction

Function Fragment_Terminal_92(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 22)
EndFunction

Function Fragment_Terminal_93(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 23)
EndFunction

Function Fragment_Terminal_94(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 24)
EndFunction

Function Fragment_Terminal_95(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 25)
EndFunction

Function Fragment_Terminal_96(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 26)
EndFunction

Function Fragment_Terminal_97(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 27)
EndFunction

Function Fragment_Terminal_98(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 28)
EndFunction

Function Fragment_Terminal_99(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 29)
EndFunction

Function Fragment_Terminal_100(ObjectReference akTerminalRef)
	SetGlobalByIndex(7, 30)
EndFunction

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

Function ToggleBool(GlobalVariable akGlobal)
	If akGlobal.GetValue() == 0
		akGlobal.SetValue(1)
		Log(akGlobal + " was set to " + akGlobal.GetValue())
	Else
		akGlobal.SetValue(0)
		Log(akGlobal + " was set to " + akGlobal.GetValue())
	EndIf
EndFunction

Function TogglePerk(Perk akPerk, Actor akActor, Bool abNotify)
	If akActor.HasPerk(akPerk)
		akActor.RemovePerk(akPerk)
		Log(akPerk + " was removed from " + akActor)
	Else
		akActor.AddPerk(akPerk, abNotify)
		Log(akPerk + " was added to " + akActor)
	EndIf
EndFunction

Function RotateFloat(GlobalVariable akGlobal)
	Float fCurrentValue = akGlobal.GetValue()
	If fCurrentValue < 1.0
		fCurrentValue += 0.1
		akGlobal.SetValue(fCurrentValue)
		Log(akGlobal + " was set to " + akGlobal.GetValue())
	Else
		fCurrentValue = 0.0
		akGlobal.SetValue(fCurrentValue)
		Log(akGlobal + " was set to " + akGlobal.GetValue())
	EndIf
EndFunction

Function SetGlobalByIndex(Int aiGlobal, Int aiValue)
	GlobalVariable akGlobal = dubhAutoLootGlobalVariables.GetAt(aiGlobal) as GlobalVariable
	akGlobal.SetValue(aiValue)
	Log(akGlobal + " was set to " + akGlobal.GetValue())
EndFunction

Function SetGlobalByIndexF(Int aiGlobal, Float aiValue)
	GlobalVariable akGlobal = dubhAutoLootGlobalVariables.GetAt(aiGlobal) as GlobalVariable
	akGlobal.SetValue(aiValue)
	Log(akGlobal + " was set to " + akGlobal.GetValue())
EndFunction

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: " + Self + "> " + msgTrace, 0)
EndFunction

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

Formlist Property dubhAutoLootGlobalVariables Auto
{
	dubhAutoLootGlobalVariables.GetAt(0) as GlobalVariable  ; dubhAutoLootAll
	dubhAutoLootGlobalVariables.GetAt(1) as GlobalVariable  ; dubhAutoLootRadius
	dubhAutoLootGlobalVariables.GetAt(2) as GlobalVariable  ; dubhAutoLootStolenFilter
	dubhAutoLootGlobalVariables.GetAt(3) as GlobalVariable  ; dubhAutoLootDelayGeneral
	dubhAutoLootGlobalVariables.GetAt(4) as GlobalVariable  ; dubhAutoLootDelayBodies
	dubhAutoLootGlobalVariables.GetAt(5) as GlobalVariable  ; dubhAutoLootDelayContainers
	dubhAutoLootGlobalVariables.GetAt(6) as GlobalVariable  ; dubhAutoLootDelayFlora
	dubhAutoLootGlobalVariables.GetAt(7) as GlobalVariable  ; dubhAutoLootContainer
	dubhAutoLootGlobalVariables.GetAt(8) as GlobalVariable  ; dubhAutoLootDefaultProcessingOnly
	dubhAutoLootGlobalVariables.GetAt(9) as GlobalVariable  ; dubhAutoLootSendToPlayerAmmo
	dubhAutoLootGlobalVariables.GetAt(10) as GlobalVariable ; dubhAutoLootSendToPlayerBodies
	dubhAutoLootGlobalVariables.GetAt(11) as GlobalVariable ; dubhAutoLootSendToPlayerContainers
	dubhAutoLootGlobalVariables.GetAt(12) as GlobalVariable ; dubhAutoLootSendToPlayerDrink
	dubhAutoLootGlobalVariables.GetAt(13) as GlobalVariable ; dubhAutoLootSendToPlayerFlora
	dubhAutoLootGlobalVariables.GetAt(14) as GlobalVariable ; dubhAutoLootSendToPlayerFood
	dubhAutoLootGlobalVariables.GetAt(15) as GlobalVariable ; dubhAutoLootSendToPlayerJunk
	dubhAutoLootGlobalVariables.GetAt(16) as GlobalVariable ; dubhAutoLootSendToPlayerMeds
	dubhAutoLootGlobalVariables.GetAt(17) as GlobalVariable ; dubhAutoLootSendToPlayerValuables
}

Formlist Property dubhAutoLootPerks Auto
{
	dubhAutoLootPerks.GetAt(0) as Perk ; Ammo
	dubhAutoLootPerks.GetAt(1) as Perk ; Bodies
	dubhAutoLootPerks.GetAt(2) as Perk ; Containers
	dubhAutoLootPerks.GetAt(3) as Perk ; Drink
	dubhAutoLootPerks.GetAt(4) as Perk ; Flora
	dubhAutoLootPerks.GetAt(5) as Perk ; Food
	dubhAutoLootPerks.GetAt(6) as Perk ; Junk
	dubhAutoLootPerks.GetAt(7) as Perk ; Meds
	dubhAutoLootPerks.GetAt(8) as Perk ; Valuables
}

