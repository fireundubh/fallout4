ScriptName AutoLoot:dubhAutoLootQuestScript Extends Quest

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnQuestInit()
	StartTimer(5, dubhAutoLootQuestTimer)
EndEvent

Event OnTimer(Int aiTimerID)
	If MQ102.IsStageDone(6) == False
		StartTimer(5, dubhAutoLootQuestTimer)
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

Int Property dubhAutoLootQuestTimer Auto

Quest Property MQ102 Auto

Form Property dubhAutoLootHolotape Auto
