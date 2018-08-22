;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_300_0400100A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Ammo Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Ammo)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Ammo Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Ammo)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Armor Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Armor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Armor Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Armor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Bodies Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Bodies)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Bodies Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Bodies)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Components Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Components)

If PlayerRef.HasPerk(AutoLoot_Perk_Valuables)
	PlayerRef.RemovePerk(AutoLoot_Perk_Valuables)
EndIf

If PlayerRef.HasPerk(AutoLoot_Perk_Junk)
	PlayerRef.RemovePerk(AutoLoot_Perk_Junk)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Components Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Components)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_10
Function Fragment_Terminal_10(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Containers Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Containers)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Containers Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Containers)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_12
Function Fragment_Terminal_12(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Drinks Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Drinks)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Drinks Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Drinks)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_14
Function Fragment_Terminal_14(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Flora Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Flora)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_15
Function Fragment_Terminal_15(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Flora Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Flora)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_16
Function Fragment_Terminal_16(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Food Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Food)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_17
Function Fragment_Terminal_17(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Food Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Food)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_18
Function Fragment_Terminal_18(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Holotapes Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Holotapes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_19
Function Fragment_Terminal_19(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Holotapes Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Holotapes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_20
Function Fragment_Terminal_20(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Junk Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Junk)

If PlayerRef.HasPerk(AutoLoot_Perk_Components)
	PlayerRef.RemovePerk(AutoLoot_Perk_Components)
EndIf

If PlayerRef.HasPerk(AutoLoot_Perk_Valuables)
	PlayerRef.RemovePerk(AutoLoot_Perk_Valuables)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_21
Function Fragment_Terminal_21(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Junk Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Junk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_22
Function Fragment_Terminal_22(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Keys Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Keys)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_23
Function Fragment_Terminal_23(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Keys Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Keys)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_24
Function Fragment_Terminal_24(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Magazines Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Magazines)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_25
Function Fragment_Terminal_25(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Magazines Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Magazines)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_26
Function Fragment_Terminal_26(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Medicine Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Medicine)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_27
Function Fragment_Terminal_27(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Medicine Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Medicine)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_28
Function Fragment_Terminal_28(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Valuables Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Valuables)

If PlayerRef.HasPerk(AutoLoot_Perk_Components)
	PlayerRef.RemovePerk(AutoLoot_Perk_Components)
EndIf

If PlayerRef.HasPerk(AutoLoot_Perk_Junk)
	PlayerRef.RemovePerk(AutoLoot_Perk_Junk)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_29
Function Fragment_Terminal_29(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Valuables Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Valuables)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_30
Function Fragment_Terminal_30(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Weapons Filter (disabled)
; ---------------------------------------------------------------------
PlayerRef.AddPerk(AutoLoot_Perk_Weapons)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_31
Function Fragment_Terminal_31(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Weapons Filter (enabled)
; ---------------------------------------------------------------------
PlayerRef.RemovePerk(AutoLoot_Perk_Weapons)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef Auto Const
Perk Property AutoLoot_Perk_Ammo Auto Const
Perk Property AutoLoot_Perk_Armor Auto Const
Perk Property AutoLoot_Perk_Bodies Auto Const
Perk Property AutoLoot_Perk_Components Auto Const
Perk Property AutoLoot_Perk_Containers Auto Const
Perk Property AutoLoot_Perk_Drinks Auto Const
Perk Property AutoLoot_Perk_Flora Auto Const
Perk Property AutoLoot_Perk_Food Auto Const
Perk Property AutoLoot_Perk_Holotapes Auto Const
Perk Property AutoLoot_Perk_Junk Auto Const
Perk Property AutoLoot_Perk_Keys Auto Const
Perk Property AutoLoot_Perk_Magazines Auto Const
Perk Property AutoLoot_Perk_Medicine Auto Const
Perk Property AutoLoot_Perk_Valuables Auto Const
Perk Property AutoLoot_Perk_Weapons Auto Const
