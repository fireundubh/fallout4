ScriptName AutoLoot:dubhAutoLootQuestScript Extends Quest

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnQuestInit()
	StartTimer(5)
EndEvent

Event OnTimer(Int aiTimerID)
	If Player.IsInLocation(PrewarSanctuaryHillsLocation) || Player.IsInLocation(PrewarVault111Location)
		StartTimer(5)
	Else
		Self.Stop()
	EndIf
EndEvent

Event OnQuestShutdown()
	Player.AddItem(dubhAutoLootHolotape, 1, False)
EndEvent

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

Actor Property Player Auto
Location Property PrewarSanctuaryHillsLocation Auto
Location Property PrewarVault111Location Auto
Form Property dubhAutoLootHolotape Auto
