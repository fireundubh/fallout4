;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_603_Del_All_0400104F Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Immediate
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Delay.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Delay.GetAt(i) as GlobalVariable
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
; [ITXT]		1 second
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Delay.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Delay.GetAt(i) as GlobalVariable
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
; [ITXT]		2 seconds
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Delay.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Delay.GetAt(i) as GlobalVariable
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
; [ITXT]		3 seconds
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Delay.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Delay.GetAt(i) as GlobalVariable
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
; [ITXT]		4 seconds
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Delay.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Delay.GetAt(i) as GlobalVariable
	kGlobal.SetValue(4)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		5 seconds
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Delay.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Delay.GetAt(i) as GlobalVariable
	kGlobal.SetValue(5)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Delay Auto Const
