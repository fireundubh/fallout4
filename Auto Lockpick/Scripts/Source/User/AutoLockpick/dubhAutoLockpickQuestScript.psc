ScriptName AutoLockpick:dubhAutoLockpickQuestScript Extends Quest

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnQuestInit()
	StartTimer(5)
EndEvent

Event OnTimer(Int aiTimerID)
	If !MQ102.IsStageDone(6)
		StartTimer(5)
	Else
		If Player.GetItemCount(dubhAutoLockpickHolotape) == 0
			Player.AddItem(dubhAutoLockpickHolotape, 1, False)
			Self.Stop()
		Else
			Self.Stop()
		EndIf
	EndIf
EndEvent

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

Actor Property Player Auto
Quest Property MQ102 Auto
Form Property dubhAutoLockpickHolotape Auto
