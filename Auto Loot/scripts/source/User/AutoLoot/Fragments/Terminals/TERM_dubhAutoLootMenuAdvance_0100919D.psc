;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname AutoLoot:Fragments:Terminals:TERM_dubhAutoLootMenuAdvance_0100919D Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(77) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(77) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(80) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(80) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(79) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(79) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhAutoLootGlobals Auto Const
Formlist Property dubhAutoLootPerks Auto Const
