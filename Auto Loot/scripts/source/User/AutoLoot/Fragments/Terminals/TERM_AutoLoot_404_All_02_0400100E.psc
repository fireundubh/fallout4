;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_404_All_02_0400100E Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Egret Tours Marina
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(6)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Finch Farm
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(14)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Graygarden
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(15)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Greentop Nursery
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(12)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Hangman's Alley
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(13)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Home Plate
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(16)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Jamaica Plain
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(17)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
