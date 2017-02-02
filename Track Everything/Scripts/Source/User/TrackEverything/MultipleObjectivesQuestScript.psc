ScriptName TrackEverything:MultipleObjectivesQuestScript Extends Quest 

Int Property TotalObjectives Auto

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
	Int i = TotalObjectives
	While i >= 0
		SetObjectiveDisplayedInGameMode(i)
		i -= 1
	EndWhile
EndEvent

Event OnQuestShutdown()
EndEvent