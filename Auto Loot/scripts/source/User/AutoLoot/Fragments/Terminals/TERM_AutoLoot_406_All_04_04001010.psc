;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_406_All_04_04001010 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Sanctuary Hills
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(23)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		The Slog
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(24)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Somerville Place
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(11)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Spectacle Island
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(25)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Starlight Drive-In
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(26)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Sunshine Tidings Co-op
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(27)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Taffington Boathouse
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(28)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_15
Function Fragment_Terminal_15(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Tenpines Bluff
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(7)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_17
Function Fragment_Terminal_17(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Warwick Homestead
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(29)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
