;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_411_Ammo_02_04001015 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Egret Tours Marina
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(1) as GlobalVariable
kGlobal.SetValue(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Finch Farm
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(1) as GlobalVariable
kGlobal.SetValue(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Graygarden
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(1) as GlobalVariable
kGlobal.SetValue(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Greentop Nursery
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(1) as GlobalVariable
kGlobal.SetValue(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Hangman's Alley
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(1) as GlobalVariable
kGlobal.SetValue(13)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Home Plate
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(1) as GlobalVariable
kGlobal.SetValue(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Jamaica Plain
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(1) as GlobalVariable
kGlobal.SetValue(17)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
