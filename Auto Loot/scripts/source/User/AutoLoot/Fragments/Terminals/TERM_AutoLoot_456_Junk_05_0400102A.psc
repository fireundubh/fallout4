;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_456_Junk_05_0400102A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Dalton Farm
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(10) as GlobalVariable
kGlobal.SetValue(31)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Echo Lake Chamber
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(10) as GlobalVariable
kGlobal.SetValue(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Longfellow's Cabin
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(10) as GlobalVariable
kGlobal.SetValue(33)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		The Mechanist's Lair
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(10) as GlobalVariable
kGlobal.SetValue(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		National Park Visitor's Center
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(10) as GlobalVariable
kGlobal.SetValue(34)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Nuka-World Red Rocket
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(10) as GlobalVariable
kGlobal.SetValue(35)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
