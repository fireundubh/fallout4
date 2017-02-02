;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName TrackEverything:Fragments:Terminals:TERM_dubhTrackEverythingMenu_0100081E Extends Terminal Hidden

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
ToggleQuest(3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhTrackEverythingQuests Auto
; 0 - All 
; 1 - Special 
; 2 - Utility 
; 3 - Weapons

Function ToggleQuest(Int iIndex)
	Quest kQuest = dubhTrackEverythingQuests.GetAt(iIndex) as Quest

	If kQuest.IsRunning()
		Int i = 20
		While i >= 0
			kQuest.SetObjectiveDisplayed(i, False, False)
			i -= 1
		EndWhile
		kQuest.Stop()
	Else
		kQuest.Start()
	EndIf
EndFunction
