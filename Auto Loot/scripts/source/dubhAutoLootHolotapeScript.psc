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

; Toggle owned item filter - TRUE: don't loot owned items, FALSE: loot all items
; -----------------------------------------------------------------------------
Function Fragment_Terminal_17(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootStolenFilter)
EndFunction

; Rotate delays by 0.1s
; -----------------------------------------------------------------------------
Function Fragment_Terminal_18(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootDelayGeneral)
EndFunction

Function Fragment_Terminal_19(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootDelayBodies)
EndFunction

Function Fragment_Terminal_21(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootDelayContainers)
EndFunction

Function Fragment_Terminal_22(ObjectReference akTerminalRef)
	RotateFloat(dubhAutoLootDelayFlora)
EndFunction

Function Fragment_Terminal_23(ObjectReference akTerminalRef)
	ToggleBool(dubhAutoLootDefaultProcessingOnly)
EndFunction

; Set container value
; -----------------------------------------------------------------------------
Function Fragment_Terminal_70(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(0)
EndFunction

Function Fragment_Terminal_71(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(1)
EndFunction

Function Fragment_Terminal_72(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(2)
EndFunction

Function Fragment_Terminal_73(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(3)
EndFunction

Function Fragment_Terminal_74(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(4)
EndFunction

Function Fragment_Terminal_75(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(5)
EndFunction

Function Fragment_Terminal_76(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(6)
EndFunction

Function Fragment_Terminal_77(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(7)
EndFunction

Function Fragment_Terminal_78(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(8)
EndFunction

Function Fragment_Terminal_79(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(9)
EndFunction

Function Fragment_Terminal_80(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(10)
EndFunction

Function Fragment_Terminal_81(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(11)
EndFunction

Function Fragment_Terminal_82(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(12)
EndFunction

Function Fragment_Terminal_83(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(13)
EndFunction

Function Fragment_Terminal_84(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(14)
EndFunction

Function Fragment_Terminal_85(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(15)
EndFunction

Function Fragment_Terminal_86(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(16)
EndFunction

Function Fragment_Terminal_87(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(17)
EndFunction

Function Fragment_Terminal_88(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(18)
EndFunction

Function Fragment_Terminal_89(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(19)
EndFunction

Function Fragment_Terminal_90(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(20)
EndFunction

Function Fragment_Terminal_91(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(21)
EndFunction

Function Fragment_Terminal_92(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(22)
EndFunction

Function Fragment_Terminal_93(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(23)
EndFunction

Function Fragment_Terminal_94(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(24)
EndFunction

Function Fragment_Terminal_95(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(25)
EndFunction

Function Fragment_Terminal_96(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(26)
EndFunction

Function Fragment_Terminal_97(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(27)
EndFunction

Function Fragment_Terminal_98(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(28)
EndFunction

Function Fragment_Terminal_99(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(29)
EndFunction

Function Fragment_Terminal_100(ObjectReference akTerminalRef)
	dubhAutoLootContainer.SetValueInt(30)
EndFunction

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

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

Function RotateFloat(GlobalVariable akGlobal)
	Float fCurrentValue = akGlobal.GetValue()
	If fCurrentValue < 1.0
		fCurrentValue += 0.1
		akGlobal.SetValue(fCurrentValue)
	Else
		fCurrentValue = 0.0
		akGlobal.SetValue(fCurrentValue)
	EndIf
EndFunction

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

GlobalVariable Property dubhAutoLootAll Auto
GlobalVariable Property dubhAutoLootRadius Auto
GlobalVariable Property dubhAutoLootStolenFilter Auto
GlobalVariable Property dubhAutoLootDelayGeneral Auto
GlobalVariable Property dubhAutoLootDelayBodies Auto
GlobalVariable Property dubhAutoLootDelayContainers Auto
GlobalVariable Property dubhAutoLootDelayFlora Auto
GlobalVariable Property dubhAutoLootContainer Auto
GlobalVariable Property dubhAutoLootDefaultProcessingOnly Auto

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

