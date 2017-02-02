;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName TrackEverything:Fragments:Terminals:TERM_dubhTrackEverythingMenu_01000822 Extends Terminal Hidden

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCCoast.esm")
	ToggleQuest(24)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCCoast.esm")
	ToggleQuest(24)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCNukaWorld.esm")
	ToggleQuest(25)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCNukaWorld.esm")
	ToggleQuest(25)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCNukaWorld.esm")
	ToggleQuest(26)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCNukaWorld.esm")
	ToggleQuest(26)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCNukaWorld.esm")
	ToggleQuest(27)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
If Game.IsPluginInstalled("DLCNukaWorld.esm")
	ToggleQuest(27)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhTrackEverythingQuests Auto
; 24 - Far Harbor - Islander's Almanacs
; 25 - Nuka World - Hidden Cappy Clues
; 26 - Nuka World - SCAV! Magazines
; 27 - Nuka World - Nuka-Cola Recipes

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
