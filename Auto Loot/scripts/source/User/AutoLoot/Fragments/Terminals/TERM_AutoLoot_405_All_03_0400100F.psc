;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_405_All_03_0400100F Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Kingsport Lighthouse
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(18)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Murkwater Construction Site
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(19)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Nordhagen Beach
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(8)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Oberland Station
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(9)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Outpost Zimonja
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(22)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Red Rocket Truck Stop
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Globals_Destination.GetSize()
	GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(i) as GlobalVariable
	kGlobal.SetValue(21)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
