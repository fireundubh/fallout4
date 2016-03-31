ScriptName dubhAutoLootEffectContainersScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] LootArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If (dubhAutoLootPerks as Bool)
		Actor Player = Game.GetPlayer()
		Perk dubhAutoLootPerk = dubhAutoLootPerks.GetAt(2) as Perk
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
				If (objLoot.GetItemCount(None) > 0)
					If (objLoot as Bool)
						If !objLoot.IsLocked()
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

	If (targetContainer as Bool)
		If dubhAutoLootAll.GetValue() == True
			If (objLoot as Bool)
				objLoot.RemoveAllItems(targetContainer, False)
			EndIf
		Else
			If (objLoot as Bool)
				If Player.HasPerk(dubhAutoLootPerks.GetAt(0) as Perk)
					RemoveItems(dubhAutoLootLists.GetAt(0) as Formlist, objLoot, False, targetContainer)
				EndIf

				If Player.HasPerk(dubhAutoLootPerks.GetAt(3) as Perk)
					RemoveItems(dubhAutoLootLists.GetAt(3) as Formlist, objLoot, False, targetContainer)
				EndIf

				If Player.HasPerk(dubhAutoLootPerks.GetAt(5) as Perk)
					RemoveItems(dubhAutoLootLists.GetAt(5) as Formlist, objLoot, False, targetContainer)
				EndIf

				If Player.HasPerk(dubhAutoLootPerks.GetAt(6) as Perk)
					RemoveItems(dubhAutoLootLists.GetAt(6) as Formlist, objLoot, False, targetContainer)
				EndIf

				If Player.HasPerk(dubhAutoLootPerks.GetAt(7) as Perk)
					RemoveItems(dubhAutoLootLists.GetAt(7) as Formlist, objLoot, False, targetContainer)
				EndIf

				If Player.HasPerk(dubhAutoLootPerks.GetAt(8) as Perk)
					RemoveItems(dubhAutoLootLists.GetAt(8) as Formlist, objLoot, False, targetContainer)
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
GlobalVariable Property dubhAutoLootAlwaysSendToPlayer Auto

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

