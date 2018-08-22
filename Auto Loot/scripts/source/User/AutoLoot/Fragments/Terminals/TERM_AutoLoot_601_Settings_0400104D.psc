;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_601_Settings_0400104D Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Filter Mode (take all)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(0) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Filter Mode (take any)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(0) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Loot Notifications (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(8) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Loot Notifications (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(8) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Loot Settlements (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(6) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Loot Settlements (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(6) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		EXPERIMENTAL: Remove Bodies On Loot (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(4) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		EXPERIMENTAL: Remove Bodies On Loot (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(4) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Settings Auto Const
