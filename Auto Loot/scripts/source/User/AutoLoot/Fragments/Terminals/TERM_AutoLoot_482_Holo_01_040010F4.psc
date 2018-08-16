;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_482_Holo_01_040010F4 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Abernathy Farm
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Boston Airport
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Bunker Hill
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		The Castle
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Coastal Cottage
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		County Crossing
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Covenant
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_15
Function Fragment_Terminal_15(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Croup Manor
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(9) as GlobalVariable
kGlobal.SetValue(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
