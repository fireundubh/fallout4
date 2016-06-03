;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname AutoLockpick:Fragments:Terminals:TERM_dubhAutoLockpickMenu_0100080B Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
If Player.HasPerk(dubhAutoLockpickPerk)
	Player.RemovePerk(dubhAutoLockpickPerk)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
If !Player.HasPerk(dubhAutoLockpickPerk)
	Player.AddPerk(dubhAutoLockpickPerk, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
dubhAutoLockpickSneakOnly.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
dubhAutoLockpickSneakOnly.Value = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
dubhAutoLockpickTakeAll.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
dubhAutoLockpickTakeAll.Value = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Player Auto Const

GlobalVariable Property dubhAutoLockpickDelay Auto Const

GlobalVariable Property dubhAutoLockpickRadius Auto Const

GlobalVariable Property dubhAutoLockpickSneakOnly Auto Const

GlobalVariable Property dubhAutoLockpickTakeAll Auto Const

Perk Property dubhAutoLockpickPerk Auto Const
