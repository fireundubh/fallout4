;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_201_All_04000FFE Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		8192 units
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Radius.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(i) as GlobalVariable
	kGlobal.SetValue(8192)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		4096 units
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Radius.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(i) as GlobalVariable
	kGlobal.SetValue(4096)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		2048 units
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Radius.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(i) as GlobalVariable
	kGlobal.SetValue(2048)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		1024 units
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Radius.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(i) as GlobalVariable
	kGlobal.SetValue(1024)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		512 units
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Radius.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(i) as GlobalVariable
	kGlobal.SetValue(512)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		256 units
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Radius.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(i) as GlobalVariable
	kGlobal.SetValue(256)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		128 units
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Radius.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(i) as GlobalVariable
	kGlobal.SetValue(128)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Radius Auto Const
