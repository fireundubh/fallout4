ScriptName dubhAutoLootEffectBodiesScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

Formlist lsBodyArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Actor Player = Game.GetPlayer()

	While Player.HasPerk(dubhAutoLootPerks.GetAt(1) as Perk)
		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
			dubhAutoLootKeywords.Revert() ; restore loot list to defaults - this was needed in skyrim to prevent a null error
			lsBodyArray = FindAllReferencesByKeywordList(dubhAutoLootKeywords, dubhAutoLootReferences, Player, dubhAutoLootRadius.GetValue())

			If lsBodyArray != None
				If lsBodyArray.GetSize() > 0
					Int i = 0
					While i < lsBodyArray.GetSize()
						ObjectReference objBody = lsBodyArray.GetAt(i) as ObjectReference
						If (objBody != None) && (Player.GetDistance(objBody) > 1.0)
							If (objBody != None) && (objBody as Actor).IsDead()
								If (objBody != None) && (objBody.GetItemCount(None) > 0)
									If dubhAutoLootStolenFilter.GetValue() == True
										If (objBody != None) && !Player.WouldBeStealing(objBody)
											LootObject(objBody)
										EndIf
									Else
										LootObject(objBody)
									EndIf
								EndIf
							EndIf
						EndIf
						i += 1
					EndWhile
				EndIf
			EndIf
			lsBodyArray = None
		EndIf
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	lsBodyArray = None
EndEvent

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

Function LootObject(ObjectReference objBody)
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
		If Player.GetDistance(objBody) <= dubhAutoLootRadius.GetValue()
			If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
				If dubhAutoLootAll.GetValue() == True
					Utility.Wait(dubhAutoLootDelay.GetValue())
					objBody.RemoveAllItems(targetContainer, False)
				Else
					If Player.HasPerk(dubhAutoLootPerks.GetAt(0) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(0) as Formlist, objBody, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(3) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(3) as Formlist, objBody, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(5) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(5) as Formlist, objBody, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(6) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(6) as Formlist, objBody, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(7) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(7) as Formlist, objBody, False, targetContainer)
					EndIf

					If Player.HasPerk(dubhAutoLootPerks.GetAt(8) as Perk)
						Utility.Wait(dubhAutoLootDelay.GetValue())
						RemoveItems(dubhAutoLootLists.GetAt(8) as Formlist, objBody, False, targetContainer)
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

Formlist Function FindAllReferencesByKeywordList(Formlist lsKeywords, Formlist lsReferences, ObjectReference akActor, Float fRadius)
	lsReferences.Revert()
	Int i = 0
	While i < lsKeywords.GetSize()
		ObjectReference[] arrReferences = akActor.FindAllReferencesWithKeyword(lsKeywords.GetAt(i), fRadius)
		Int j = 0
		While j < arrReferences.Length
			lsReferences.AddForm(arrReferences[j] as Form)
			j += 1
		EndWhile
		i += 1
	EndWhile
	Return lsReferences
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

; Actor Keywords
Formlist Property dubhAutoLootKeywords Auto

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

; Perks
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

; References
Formlist Property dubhAutoLootReferences Auto

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

