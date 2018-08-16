;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_407_All_05_04001011 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Dalton Farm
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(31)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Echo Lake Chamber
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(32)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Longfellow's Cabin
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(33)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		The Mechanist's Lair
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(30)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		National Park Visitor's Center
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(34)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Nuka-World Red Rocket
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(35)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
