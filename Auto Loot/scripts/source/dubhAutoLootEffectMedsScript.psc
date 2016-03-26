ScriptName dubhAutoLootEffectMedsScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] LootArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Actor Player = Game.GetPlayer()

	While Player.HasPerk(dubhAutoLootPerk)
		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
			Float fAutoLootRadius = dubhAutoLootRadius.GetValue()
			dubhAutoLootFilter.Revert() ; restore loot list to defaults - this was needed in skyrim to prevent a null error
			LootArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, fAutoLootRadius)

			If (LootArray != None) && (LootArray.Length > 0)

				Int i = 0
				While (LootArray != None) && (i < LootArray.Length)
					ObjectReference objLoot = LootArray[i]

					If (objLoot != None) && (objLoot.GetContainer() == None) && (objLoot.GetContainer() != Player)
						If dubhAutoLootStolenFilter.GetValue() == True
							If (objLoot != None) && !Player.WouldBeStealing(objLoot)
								LootObject(objLoot, fAutoLootRadius)
							EndIf
						Else
							LootObject(objLoot, fAutoLootRadius)
						EndIf
					EndIf

					i += 1
				EndWhile
			EndIf

			LootArray = None
		EndIf
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	LootArray = None
EndEvent

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

Function LootObject(ObjectReference objLoot, Float fAutoLootRadius)
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

	If targetContainer != None
		If Player.GetDistance(objLoot) <= fAutoLootRadius
			If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
				Utility.Wait(dubhAutoLootDelay.GetValue())
				If targetContainer != Player
					objLoot.Activate(dubhAutoLootDummyActor, True)
					dubhAutoLootDummyActor.RemoveAllItems(targetContainer, False)
				Else
					objLoot.Activate(Player, dubhAutoLootDefaultProcessingOnly.GetValue() as Bool)
				EndIf
			EndIf
		EndIf ; None
	EndIf
EndFunction

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

