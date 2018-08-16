;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_442_Flora_03_04001047 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Kingsport Lighthouse
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(7) as GlobalVariable
kGlobal.SetValue(18)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Murkwater Construction Site
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(7) as GlobalVariable
kGlobal.SetValue(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Nordhagen Beach
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(7) as GlobalVariable
kGlobal.SetValue(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Oberland Station
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(7) as GlobalVariable
kGlobal.SetValue(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Outpost Zimonja
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(7) as GlobalVariable
kGlobal.SetValue(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Red Rocket Truck Stop
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Destination.GetAt(7) as GlobalVariable
kGlobal.SetValue(21)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Destination Auto Const
