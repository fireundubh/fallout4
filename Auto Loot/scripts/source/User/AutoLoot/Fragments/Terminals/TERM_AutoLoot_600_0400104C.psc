;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_600_0400104C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Retrieve Lost Items
; ---------------------------------------------------------------------
Int i = 0
While i < AutoLoot_Dummies.GetSize()
	ObjectReference DummyActor = AutoLoot_Dummies.GetAt(i) as ObjectReference
	DummyActor.RemoveAllItems(PlayerRef, AutoLoot_Setting_StealingIsHostile.Value)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef Auto Const

FormList Property AutoLoot_Dummies Auto Const

GlobalVariable Property AutoLoot_Setting_StealingIsHostile Auto Const
