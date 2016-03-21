ScriptName dubhAutoLootEffectContainersScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] ContainerArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Actor Player = Game.GetPlayer()

	While Player.HasPerk(dubhAutoLootPerks.GetAt(2) as Perk)
		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
			dubhAutoLootFilter.Revert() ; restore loot list to defaults - this was needed in skyrim to prevent a null error
			ContainerArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, dubhAutoLootRadius.GetValue())

			If ContainerArray != None
				If ContainerArray.Length > 0
					Int i = 0
					While i < ContainerArray.Length
						ObjectReference objContainer = ContainerArray[i]
						If (objContainer != None) && (Player.GetDistance(objContainer) > 1.0)
							If (objContainer != None) && (objContainer.GetItemCount(None) > 0)
								If (objContainer != None) && !objContainer.IsLocked()
									If dubhAutoLootStolenFilter.GetValue() == True
										If (objContainer != None) && !Player.WouldBeStealing(objContainer)
											LootObject(objContainer)
										EndIf
									Else
										LootObject(objContainer)
									EndIf
								EndIf
							EndIf
						EndIf
						i += 1
					EndWhile
				EndIf
			EndIf
			ContainerArray = None
		EndIf
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	ContainerArray = None
EndEvent

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

Function LootObject(ObjectReference objContainer)
	Actor Player = Game.GetPlayer()

	Int containerId = 0
	ObjectReference targetContainer = None

	If dubhAutoLootContainer.GetValueInt() == 0
		targetContainer = Player
	Else
		containerId = dubhAutoLootContainer.GetValueInt()
		targetContainer = (dubhAutoLootSettlements.GetAt(containerId) as WorkshopScript) as ObjectReference
	EndIf

	If targetContainer != None
		If Player.GetDistance(objContainer) <= dubhAutoLootRadius.GetValue()
			If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
				If dubhAutoLootAll.GetValue() == True
					Utility.Wait(dubhAutoLootDelay.GetValue())
					objContainer.RemoveAllItems(targetContainer, False)
				Else
					If Player.HasPerk(dubhAutoLootPerks.GetAt(0) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(0) as Formlist, objContainer, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(3) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(3) as Formlist, objContainer, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(5) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(5) as Formlist, objContainer, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(6) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(6) as Formlist, objContainer, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(7) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(7) as Formlist, objContainer, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(8) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(8) as Formlist, objContainer, False, targetContainer)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Bool Function RemoveItems(Formlist akFormlist, ObjectReference akContainer, Bool abSilent, ObjectReference akOtherContainer)
	Bool bItemsRemoved = False
	Int i = 0
	While i < akFormlist.GetSize()
		Form objLoot = akFormlist.GetAt(i)
		Int lootCount = akContainer.GetItemCount(objLoot)
		If lootCount > 0
			akContainer.RemoveItem(objLoot, lootCount, abSilent, akOtherContainer)
			bItemsRemoved = True
		EndIf
		i += 1
	EndWhile
	Return bItemsRemoved
EndFunction

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: " + Self + "> " + msgTrace, 0)
EndFunction

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

; Globals
GlobalVariable Property dubhAutoLootAll Auto
GlobalVariable Property dubhAutoLootRadius Auto
GlobalVariable Property dubhAutoLootStolenFilter Auto
GlobalVariable Property dubhAutoLootDelay Auto
GlobalVariable Property dubhAutoLootContainer Auto

; Bodies/Container List
Formlist Property dubhAutoLootFilter Auto

; Loot Lists
Formlist Property dubhAutoLootLists Auto
{
	dubhAutoLootLists.GetAt(0) ; Ammo
	dubhAutoLootLists.GetAt(1) ; Bodies
	dubhAutoLootLists.GetAt(2) ; Containers
	dubhAutoLootLists.GetAt(3) ; Drink
	dubhAutoLootLists.GetAt(4) ; Flora
	dubhAutoLootLists.GetAt(5) ; Food
	dubhAutoLootLists.GetAt(6) ; Junk
	dubhAutoLootLists.GetAt(7) ; Meds
	dubhAutoLootLists.GetAt(8) ; Valuables
}

; Skip Lists
Formlist Property dubhAutoLootPerks Auto
{
	dubhAutoLootPerks.GetAt(0) ; Ammo
	dubhAutoLootPerks.GetAt(1) ; Bodies
	dubhAutoLootPerks.GetAt(2) ; Containers
	dubhAutoLootPerks.GetAt(3) ; Drink
	dubhAutoLootPerks.GetAt(4) ; Flora
	dubhAutoLootPerks.GetAt(5) ; Food
	dubhAutoLootPerks.GetAt(6) ; Junk
	dubhAutoLootPerks.GetAt(7) ; Meds
	dubhAutoLootPerks.GetAt(8) ; Valuables
}

Formlist Property dubhAutoLootSettlements Auto
; (BostonAirportWorkshopRef as WorkshopScript).SetOwnedByPlayer(False)
; (dubhAutoLootSettlements.GetAt(0) as WorkshopScript).IsOwnedBy(Game.GetPlayer())
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
	dubhAutoLootSettlements.GetAt(25)	; Slog
	dubhAutoLootSettlements.GetAt(26)	; Spectacle Island
	dubhAutoLootSettlements.GetAt(27)	; Starlight Drive-In
	dubhAutoLootSettlements.GetAt(28)	; Sunshine Tidings
	dubhAutoLootSettlements.GetAt(29)	; Taffington Boat House
	dubhAutoLootSettlements.GetAt(30)	; Warwick Homestead
}

