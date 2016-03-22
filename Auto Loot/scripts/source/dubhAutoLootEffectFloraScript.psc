ScriptName dubhAutoLootEffectFloraScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] LootArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Actor Player = Game.GetPlayer()

	Float fFirstLootTime = -1.0

	While Player.HasPerk(dubhAutoLootPerk)
		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
			Float fCellResetTime = Game.GetGameSettingInt("iHoursToRespawnCell") as Float ; get the cell reset time as a float - this is in main loop so changing the setting in game will affect loop
			dubhAutoLootFilter.Revert() ; restore loot list to defaults - this was needed in skyrim to prevent a null error
			LootArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, dubhAutoLootRadius.GetValue())

			If (LootArray != None) && (LootArray.Length > 0)

				Int i = 0
				While (LootArray != None) && (i < LootArray.Length)

					If (LootArray != None) && (LootArray[i] != None)
						; check if we can clear the skip list
						If fFirstLootTime > -1.0
							If Utility.GetCurrentGameTime() >= (fCellResetTime + fFirstLootTime)
								dubhAutoLootSkip.Revert()
								fFirstLootTime = -1.0
							EndIf
						EndIf

						; filter the loot array using the skip list
						If dubhAutoLootSkip.GetSize() > 0
							If dubhAutoLootSkip.HasForm(LootArray[i] as Form)
								If (LootArray != None) && (LootArray[i] != None)
									LootArray[i] = None
								EndIf
							EndIf
						EndIf

						; loot item
						If (LootArray != None) && (LootArray[i] != None)
							ObjectReference objLoot = LootArray[i]
							If (objLoot != None) && !objLoot.IsDestroyed()
								If (objLoot != None) && (Player.GetDistance(objLoot) > 1.0)
									If dubhAutoLootStolenFilter.GetValue() == True
										If (objLoot != None) && !Player.WouldBeStealing(objLoot)
											LootObject(objLoot, fFirstLootTime)
										EndIf
									Else
										LootObject(objLoot, fFirstLootTime)
									EndIf
								EndIf
							EndIf
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

Function LootObject(ObjectReference objLoot, Float fFirstLootTime)
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
		; max distance check
		If Player.GetDistance(objLoot) <= dubhAutoLootRadius.GetValue()

			; activate object
			If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
				Utility.Wait(dubhAutoLootDelay.GetValue())
				If targetContainer != Player
					If objLoot.Activate(dubhAutoLootDummyActor, True)
						dubhAutoLootSkip.AddForm(objLoot)
						If fFirstLootTime < 0
							fFirstLootTime = Utility.GetCurrentGameTime()
						EndIf
					EndIf
					dubhAutoLootDummyActor.RemoveAllItems(targetContainer, False)
				Else
					If objLoot.Activate(Player, dubhAutoLootDefaultProcessingOnly.GetValue() as Bool)
						; add form to filter
						dubhAutoLootSkip.AddForm(objLoot)

						; track the time of the first auto looted object
						; important: the skip list will be reset when the first object on the list was last looted before fCellResetTime
						If fFirstLootTime < 0
							fFirstLootTime = Utility.GetCurrentGameTime()
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
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

; Lists
Formlist Property dubhAutoLootFilter Auto
Formlist Property dubhAutoLootSkip Auto

; Globals
GlobalVariable Property dubhAutoLootRadius Auto
GlobalVariable Property dubhAutoLootStolenFilter Auto
GlobalVariable Property dubhAutoLootDelay Auto
GlobalVariable Property dubhAutoLootContainer Auto
GlobalVariable Property dubhAutoLootDefaultProcessingOnly Auto ; abDefaultProcessingOnly toggle

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
