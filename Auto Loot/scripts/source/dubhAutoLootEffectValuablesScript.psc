ScriptName dubhAutoLootEffectValuablesScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] LootArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If (dubhAutoLootPerk as Bool)
		Actor Player = Game.GetPlayer()
		If Player.HasPerk(dubhAutoLootPerk)
			While Player.HasPerk(dubhAutoLootPerk)
				If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
					LootArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, dubhAutoLootRadius.GetValue())
					If (LootArray as Bool)
						If (LootArray.Length > 0)
							Int i = 0
							While (Player.HasPerk(dubhAutoLootPerk) && (LootArray as Bool) && (i < LootArray.Length))
								ObjectReference objLoot = LootArray[i]
								If IsLootable(objLoot)
									If dubhAutoLootStolenFilter.GetValue() == True
										If (objLoot as Bool)
											If !Player.WouldBeStealing(objLoot)
												LootObject(objLoot)
											EndIf
										EndIf
									Else
										If (objLoot as Bool)
											LootObject(objLoot)
										EndIf
									EndIf
								EndIf
								i += 1
							EndWhile
						EndIf
					EndIf
					LootArray = None
				EndIf
				Utility.Wait(dubhAutoLootDelay.GetValue())
			EndWhile
		EndIf
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	LootArray = None
EndEvent

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

Bool Function IsLootable(ObjectReference objLoot)
	Actor Player = Game.GetPlayer()
	If (objLoot as Bool)
		If (Player.GetDistance(objLoot) > 1.0)
			If (objLoot as Bool)
				If (objLoot.GetContainer() == None)
					If (objLoot as Bool)
						If (objLoot.GetContainer() != Player)
							If (objLoot as Bool)
								Return True
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Function LootObject(ObjectReference objLoot)
	Actor Player = Game.GetPlayer()

	Int containerId = 0
	ObjectReference targetContainer = None

	If dubhAutoLootContainer.GetValueInt() == 0
		targetContainer = Player
	ElseIf dubhAutoLootAlwaysSendToPlayer.GetValue() == True
		targetContainer = Player
	Else
		containerId = dubhAutoLootContainer.GetValueInt()
		targetContainer = (dubhAutoLootSettlements.GetAt(containerId) as WorkshopScript) as ObjectReference
	EndIf

	If (targetContainer as Bool) && (objLoot as Bool)
		Utility.Wait(dubhAutoLootDelay.GetValue())
		If (targetContainer != Player)
			If (objLoot as Bool)
				objLoot.Activate(dubhAutoLootDummyActor, True)
				dubhAutoLootDummyActor.RemoveAllItems(targetContainer, False)
			EndIf
		Else
			If (objLoot as Bool)
				objLoot.Activate(Player, dubhAutoLootDefaultProcessingOnly.GetValue() as Bool)
			EndIf
		EndIf
	EndIf
EndFunction

;Formlist Function ArrayToFormlist(ObjectReference[] arObjects)
;	Formlist akFormlist = None
;	Int i = 0
;	While (i < arObjects.Length)
;		Form objForm = arObjects[i] as Form
;		If (objForm as Bool)
;			akFormlist.AddForm(objForm)
;		EndIf
;	EndWhile
;	Return akFormlist
;EndFunction

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: " + Self + "> " + msgTrace, 0)
EndFunction

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

; Actors
Actor Property dubhAutoLootDummyActor Auto ; dummy actor for alternate container looting

; Perks
Perk Property dubhAutoLootPerk Auto

; Loot List
Formlist Property dubhAutoLootFilter Auto

; Globals
GlobalVariable Property dubhAutoLootRadius Auto
GlobalVariable Property dubhAutoLootStolenFilter Auto
GlobalVariable Property dubhAutoLootDelay Auto
GlobalVariable Property dubhAutoLootContainer Auto
GlobalVariable Property dubhAutoLootDefaultProcessingOnly Auto ; abDefaultProcessingOnly toggle
GlobalVariable Property dubhAutoLootAlwaysSendToPlayer Auto

Formlist Property dubhAutoLootSettlements Auto
; (BostonAirportWorkshopRef as WorkshopScript).SetOwnedByPlayer(False)
; (dubhAutoLootSettlements.GetAt(2) as WorkshopScript).SetOwnedByPlayer(False)
{
	dubhAutoLootSettlements.GetAt(0)	; Player

	dubhAutoLootSettlements.GetAt(1)	; Abernathy Farm
	dubhAutoLootSettlements.GetAt(2)	; Boston Airport
	dubhAutoLootSettlements.GetAt(3)	; Bunker Hill
	dubhAutoLootSettlements.GetAt(4)	; Castle
	dubhAutoLootSettlements.GetAt(5)	; Covenant
	dubhAutoLootSettlements.GetAt(6)	; Croup Manor
	dubhAutoLootSettlements.GetAt(7)	; Egret Tours

	dubhAutoLootSettlements.GetAt(8)	; Farm 1
	dubhAutoLootSettlements.GetAt(9)	; Farm 2
	dubhAutoLootSettlements.GetAt(10)	; Farm 3
	dubhAutoLootSettlements.GetAt(11)	; Farm 4
	dubhAutoLootSettlements.GetAt(12)	; Farm 5
	dubhAutoLootSettlements.GetAt(13)	; Farm 6
	dubhAutoLootSettlements.GetAt(14)	; Fens Raider Camp
	dubhAutoLootSettlements.GetAt(15)	; Finch Farm

	dubhAutoLootSettlements.GetAt(16)	; Graygarden
	dubhAutoLootSettlements.GetAt(17)	; Home Plate
	dubhAutoLootSettlements.GetAt(18)	; Jamaica Plain
	dubhAutoLootSettlements.GetAt(19)	; Kingsport Lighthouse
	dubhAutoLootSettlements.GetAt(20)	; Murkwater Construction Site
	dubhAutoLootSettlements.GetAt(21)	; Coastal Cottage
	dubhAutoLootSettlements.GetAt(22)	; Red Rocket
	dubhAutoLootSettlements.GetAt(23)	; Relay Tower

	dubhAutoLootSettlements.GetAt(24)	; Sanctuary Hills
	dubhAutoLootSettlements.GetAt(25)	; The Slog
	dubhAutoLootSettlements.GetAt(26)	; Spectacle Island
	dubhAutoLootSettlements.GetAt(27)	; Starlight Drive-In
	dubhAutoLootSettlements.GetAt(28)	; Sunshine Tidings
	dubhAutoLootSettlements.GetAt(29)	; Taffington Boat House
	dubhAutoLootSettlements.GetAt(30)	; Warwick Homestead
}

