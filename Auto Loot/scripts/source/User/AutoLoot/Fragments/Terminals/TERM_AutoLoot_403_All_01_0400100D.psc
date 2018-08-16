;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_403_All_01_0400100D Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Abernathy Farm
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(0)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Boston Airport
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(1)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Bunker Hill
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(2)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		The Castle
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(3)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Coastal Cottage
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(20)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		County Crossing
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(10)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Covenant
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(4)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_15
Function Fragment_Terminal_15(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Croup Manor
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(5)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
