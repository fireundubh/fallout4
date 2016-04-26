;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname AutoLoot:Fragments:Terminals:TERM_dubhAutoLootMenuContain_010026F7 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < 10
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(77)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < 10
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(85)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < 10
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(86)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < 10
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(83)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < 10
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(84)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < 10
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(87)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 0
While i < 10
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(88)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhAutoLootGlobals Auto Const
Formlist Property dubhAutoLootPerks Auto Const
