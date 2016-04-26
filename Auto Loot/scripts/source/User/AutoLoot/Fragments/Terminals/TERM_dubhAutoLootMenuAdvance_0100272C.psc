;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname AutoLoot:Fragments:Terminals:TERM_dubhAutoLootMenuAdvance_0100272C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 10
While i < 21
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(0)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 10
While i < 21
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(1)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 10
While i < 21
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(2)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 10
While i < 21
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(3)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 10
While i < 21
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(4)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 10
While i < 21
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(5)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhAutoLootGlobals Auto Const
Formlist Property dubhAutoLootPerks Auto Const
