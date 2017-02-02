ScriptName TrackEverything:SingleObjectiveQuestScript Extends Quest 

Function SetObjectiveDisplayedInGameMode(Int iObjectiveIndex)
	If !IsObjectiveDisplayed(iObjectiveIndex)
		While Utility.IsInMenuMode()
			Utility.Wait(0.5)
		EndWhile
		Self.SetObjectiveDisplayed(iObjectiveIndex, True, False)
		Utility.Wait(1.4)
	EndIf
EndFunction

Event OnQuestInit()
	SetObjectiveDisplayedInGameMode(0)
EndEvent

Event OnQuestShutdown()
EndEvent