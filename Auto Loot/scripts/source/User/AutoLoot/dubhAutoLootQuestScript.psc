ScriptName AutoLoot:dubhAutoLootQuestScript Extends Quest

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnQuestInit()
	Self.RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")

	If MQ101.IsCompleted() == True
		If PlayerRef.GetItemCount(AutoLoot_Holotape) == 0
			PlayerRef.AddItem(AutoLoot_Holotape, 1, False)
		EndIf
	Else
		RegisterForRemoteEvent(MQ102, "OnStageSet")
	EndIf
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
	; v111 elevator exit radios on
	If akSender == MQ102 && auiStageID == 15
		UnRegisterForRemoteEvent(MQ102, "OnStageSet")

		If PlayerRef.GetItemCount(AutoLoot_Holotape) == 0
			PlayerRef.AddItem(AutoLoot_Holotape, 1, False)
		EndIf
	Endif
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	If PlayerRef.GetItemCount(AutoLoot_Holotape) == 0
		PlayerRef.AddItem(AutoLoot_Holotape, 1, False)
	EndIf
EndEvent

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

Actor Property PlayerRef Auto
Form Property AutoLoot_Holotape Auto

Quest Property MQ101 Auto Const Mandatory
Quest Property MQ102 Auto Const Mandatory
