ScriptName AutoLoot:dubhAutoLootQuestScript Extends Quest

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnQuestInit()
	StartTimer(10, dubhAutoLootQuestTimer)
EndEvent

Event OnTimer(Int aiTimerID)
	If MQ102.IsStageDone(6) == False
		StartTimer(10, dubhAutoLootQuestTimer)
	Else
		Self.Stop()
	EndIf
EndEvent

Event OnQuestShutdown()
	Game.GetPlayer().AddItem(dubhAutoLootHolotape, 1, False)
EndEvent

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

Int Property dubhAutoLootQuestTimer Auto

Quest Property MQ102 Auto

Form Property dubhAutoLootHolotape Auto
