ScriptName dubhAutoLootQuestScript Extends Quest

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnQuestInit()
	While MQ102.IsStageDone(6) == False
		; waiting until the Pip-Boy sequence finishes
	EndWhile
	Self.Stop()
EndEvent

Event OnQuestShutdown()
	Game.GetPlayer().AddItem(dubhAutoLootHolotape, 1, False)
EndEvent

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: " + Self + "> " + msgTrace, 0)
EndFunction

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

Quest Property MQ102 Auto

Form Property dubhAutoLootHolotape Auto
