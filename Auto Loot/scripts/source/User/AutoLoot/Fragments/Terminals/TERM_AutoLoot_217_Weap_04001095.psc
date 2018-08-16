;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_217_Weap_04001095 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		8192 units
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(15) as GlobalVariable
kGlobal.SetValue(8192)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		4096 units
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(15) as GlobalVariable
kGlobal.SetValue(4096)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		2048 units
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(15) as GlobalVariable
kGlobal.SetValue(2048)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		1024 units
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(15) as GlobalVariable
kGlobal.SetValue(1024)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		512 units
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(15) as GlobalVariable
kGlobal.SetValue(512)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		256 units
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(15) as GlobalVariable
kGlobal.SetValue(256)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		128 units
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Radius.GetAt(15) as GlobalVariable
kGlobal.SetValue(128)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Radius Auto Const
