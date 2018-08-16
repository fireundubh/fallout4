;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_500_0400104B Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Lockpick (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(5) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Lockpick (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(5) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Steal (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(2) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Steal (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(2) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Steal Mode (only owned)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(3) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Steal Mode (owned and unowned)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(3) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Steal Reaction (hostile)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(1) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Auto Steal Reaction (none)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Settings.GetAt(1) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Settings Auto Const
