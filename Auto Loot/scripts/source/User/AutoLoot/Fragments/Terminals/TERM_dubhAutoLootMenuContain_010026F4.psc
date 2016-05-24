;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname AutoLoot:Fragments:Terminals:TERM_dubhAutoLootMenuContain_010026F4 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Int i = 9
While i > -1
	GlobalVariable kGlobal = dubhAutoLootGlobals.GetAt(i) as GlobalVariable
	kGlobal.SetValue(0)
	i -= 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property dubhAutoLootGlobals Auto Const
Formlist Property dubhAutoLootPerks Auto Const
