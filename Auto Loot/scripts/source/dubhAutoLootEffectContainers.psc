ScriptName dubhAutoLootEffectContainers Extends ActiveMagicEffect

; 15 properties

; Globals
GlobalVariable Property dubhAutoLootAll Auto
GlobalVariable Property dubhAutoLootRadius Auto

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

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: dubhAutoLootEffectContainers> " + msgTrace, 0)
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

Function OnEffectStart(Actor akTarget, Actor akCaster)

	Actor Player = Game.GetPlayer()

	; main loop
	While Player.HasPerk(dubhAutoLootPerks.GetAt(2) as Perk)

		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()

			; restore loot list to defaults - this was needed in skyrim to prevent a null error
			dubhAutoLootFilter.Revert()

			; create an array of container references in the defined global radius with the player at the center
			ObjectReference[] ContainerArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, dubhAutoLootRadius.GetValue())

			If ContainerArray != None

				; check if the container array has items
				If ContainerArray.Length > 0

					; container array loop
					Int i = 0
					While i < ContainerArray.Length

						; instantiate object variable
						ObjectReference objContainer = ContainerArray[i]

						; check if array item is not null
						If objContainer != None

							; check if container is loaded and not disabled
							If objContainer.Is3DLoaded() && !objContainer.IsDisabled() && (Player.GetDistance(objContainer) > 1.0)

								; check if container has no items - skip if empty
								If objContainer.GetItemCount(None) > 0

									; check if container is not locked - skip if locked
									If !objContainer.IsLocked()

										; check if object is unowned
										If !Player.WouldBeStealing(objContainer)

											; max distance check
											If Player.GetDistance(objContainer) <= dubhAutoLootRadius.GetValue()

												; activate object
												If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
													If dubhAutoLootAll.GetValue() == True
														objContainer.RemoveAllItems(Player, False)
													Else
														If Player.HasPerk(dubhAutoLootPerks.GetAt(0) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(0) as Formlist, objContainer, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(3) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(3) as Formlist, objContainer, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(5) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(5) as Formlist, objContainer, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(6) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(6) as Formlist, objContainer, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(7) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(7) as Formlist, objContainer, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(8) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(8) as Formlist, objContainer, False, Player)
														EndIf
													EndIf
												EndIf
											EndIf
										EndIf
									EndIf
								EndIf
							EndIf
						EndIf
						i += 1
					EndWhile ; endwhile for loot array loop
				EndIf
			EndIf
		EndIf
	EndWhile ; endwhile for main loop

EndFunction

Function OnEffectFinish(Actor akTarget, Actor akCaster)
EndFunction