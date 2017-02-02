;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName TrackEverything:Fragments:Terminals:TERM_dubhTrackEverythingMenu_0100081D Extends Terminal Hidden

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < dubhTrackEverythingQuests.GetSize()
	Quest kQuest = dubhTrackEverythingQuests.GetAt(i) as Quest

	If kQuest.IsRunning()
		Int j = 20
		While j >= 0
			kQuest.SetObjectiveDisplayed(j, False, False)
			j -= 1
		EndWhile
		kQuest.Stop()
	EndIf

	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhTrackEverythingQuests Auto