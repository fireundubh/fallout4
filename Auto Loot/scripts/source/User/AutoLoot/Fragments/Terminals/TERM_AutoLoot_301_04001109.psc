;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName AutoLoot:Fragments:Terminals:TERM_AutoLoot_301_04001109 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Acid (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(0) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Acid (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(0) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Adhesive (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(1) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Adhesive (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(1) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Aluminum (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(2) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Aluminum (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(2) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Antiseptic (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(3) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Antiseptic (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(3) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Asbestos (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(4) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_10
Function Fragment_Terminal_10(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Asbestos (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(4) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Ballistic Fiber (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(5) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_12
Function Fragment_Terminal_12(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Ballistic Fiber (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(5) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Bone (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(6) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_14
Function Fragment_Terminal_14(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Bone (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(6) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_15
Function Fragment_Terminal_15(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Ceramic (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(7) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_16
Function Fragment_Terminal_16(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Ceramic (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(7) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_17
Function Fragment_Terminal_17(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Circuitry (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(8) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_18
Function Fragment_Terminal_18(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Circuitry (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(8) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_19
Function Fragment_Terminal_19(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Cloth (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(9) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_20
Function Fragment_Terminal_20(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Cloth (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(9) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_21
Function Fragment_Terminal_21(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Concrete (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(10) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_22
Function Fragment_Terminal_22(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Concrete (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(10) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_23
Function Fragment_Terminal_23(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Copper (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(11) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_24
Function Fragment_Terminal_24(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Copper (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(11) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_25
Function Fragment_Terminal_25(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Cork (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(12) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_26
Function Fragment_Terminal_26(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Cork (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(12) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_27
Function Fragment_Terminal_27(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Crystal (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(13) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_28
Function Fragment_Terminal_28(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Crystal (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(13) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_29
Function Fragment_Terminal_29(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Fertilizer (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(14) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_30
Function Fragment_Terminal_30(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Fertilizer (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(14) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_31
Function Fragment_Terminal_31(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Fiber Optics (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(15) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_32
Function Fragment_Terminal_32(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Fiber Optics (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(15) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_33
Function Fragment_Terminal_33(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Fiberglass (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(16) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_34
Function Fragment_Terminal_34(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Fiberglass (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(16) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_35
Function Fragment_Terminal_35(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Gears (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(17) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_36
Function Fragment_Terminal_36(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Gears (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(17) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_37
Function Fragment_Terminal_37(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Glass (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(18) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_38
Function Fragment_Terminal_38(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Glass (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(18) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_39
Function Fragment_Terminal_39(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Gold (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(19) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_40
Function Fragment_Terminal_40(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Gold (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(19) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_41
Function Fragment_Terminal_41(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Lead (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(20) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_42
Function Fragment_Terminal_42(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Lead (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(20) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_43
Function Fragment_Terminal_43(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Leather (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(21) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_44
Function Fragment_Terminal_44(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Leather (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(21) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_45
Function Fragment_Terminal_45(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Nuclear Material (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(22) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_46
Function Fragment_Terminal_46(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Nuclear Material (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(22) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_47
Function Fragment_Terminal_47(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Oil (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(23) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_48
Function Fragment_Terminal_48(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Oil (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(23) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_49
Function Fragment_Terminal_49(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Plastic (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(24) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_50
Function Fragment_Terminal_50(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Plastic (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(24) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_51
Function Fragment_Terminal_51(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Rubber (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(25) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_52
Function Fragment_Terminal_52(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Rubber (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(25) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_53
Function Fragment_Terminal_53(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Screws (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(26) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_54
Function Fragment_Terminal_54(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Screws (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(26) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_55
Function Fragment_Terminal_55(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Silver (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(27) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_56
Function Fragment_Terminal_56(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Silver (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(27) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_57
Function Fragment_Terminal_57(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Springs (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(28) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_58
Function Fragment_Terminal_58(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Springs (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(28) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_59
Function Fragment_Terminal_59(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Steel (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(29) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_60
Function Fragment_Terminal_60(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Steel (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(29) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_61
Function Fragment_Terminal_61(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Wood (disabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(30) as GlobalVariable
kGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_62
Function Fragment_Terminal_62(ObjectReference akTerminalRef)
;BEGIN CODE
; ---------------------------------------------------------------------
; [ITXT]		Wood (enabled)
; ---------------------------------------------------------------------
GlobalVariable kGlobal = AutoLoot_Globals_Components.GetAt(30) as GlobalVariable
kGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AutoLoot_Globals_Components Auto Const
