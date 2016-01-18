ScriptName dubhAutoLootEffectBodies Extends ActiveMagicEffect

; 11 properties

; Globals
GlobalVariable Property dubhAutoLootAll Auto
GlobalVariable Property dubhAutoLootRadius Auto

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


Function Log(String msgTrace)
	Debug.Trace("Auto Loot: dubhAutoLootEffectBodies> " + msgTrace, 0)
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
	; revert references formlist
	lsReferences.Revert()

	; iterate through keyword formlist
	Int i = 0
	While i < lsKeywords.GetSize()
		ObjectReference[] arrReferences = akActor.FindAllReferencesWithKeyword(lsKeywords.GetAt(i), fRadius)

		; iterate through reference array, and add each item to lsReferences
		Int j = 0
		While j < arrReferences.Length
			lsReferences.AddForm(arrReferences[j] as Form)
			j += 1
		EndWhile

		i += 1
	EndWhile

	Return lsReferences
EndFunction


Function OnEffectStart(Actor akTarget, Actor akCaster)

	Actor Player = Game.GetPlayer()

	; main loop
	While Player.HasPerk(dubhAutoLootPerks.GetAt(1) as Perk)

		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()

			; restore loot list to defaults - this was needed in skyrim to prevent a null error
			dubhAutoLootKeywords.Revert()

			; create an array of container references in the defined global radius with the player at the center
			Formlist lsBodyArray = FindAllReferencesByKeywordList(dubhAutoLootKeywords, dubhAutoLootReferences, Player, dubhAutoLootRadius.GetValue())
			;ObjectReference[] lsBodyArray = Player.FindAllReferencesOfType(dubhAutoLootKeywords, dubhAutoLootRadius.GetValue())

			If lsBodyArray != None

				; check if the container array has items
				If lsBodyArray.GetSize() > 0

					; container array loop
					Int i = 0
					While i < lsBodyArray.GetSize()

						; instantiate object variable
						ObjectReference objBody = lsBodyArray.GetAt(i) as ObjectReference

						; check if array item is not null
						If objBody != None

							; check if container is loaded and not disabled
							If objBody.Is3DLoaded() && !objBody.IsDisabled() && (Player.GetDistance(objBody) > 1.0)

								; check if actor is dead
								If (objBody as Actor).IsDead()

									; check if container has no items - skip if empty
									If objBody.GetItemCount(None) > 0

										; check if object is unowned
										If !Player.WouldBeStealing(objBody)

											; max distance check
											If Player.GetDistance(objBody) <= dubhAutoLootRadius.GetValue()

												; activate object
												If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
													If dubhAutoLootAll.GetValue() == True
														objBody.RemoveAllItems(Player, False)
													Else
														If Player.HasPerk(dubhAutoLootPerks.GetAt(0) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(0) as Formlist, objBody, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(3) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(3) as Formlist, objBody, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(5) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(5) as Formlist, objBody, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(6) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(6) as Formlist, objBody, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(7) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(7) as Formlist, objBody, False, Player)
														EndIf

														If Player.HasPerk(dubhAutoLootPerks.GetAt(8) as Perk)
															RemoveItems(dubhAutoLootLists.GetAt(8) as Formlist, objBody, False, Player)
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
				EndIf ; body formlist size
			EndIf ; body formlist null
		EndIf ; IsInMenuMode
	EndWhile ; endwhile for main loop

EndFunction

Function OnEffectFinish(Actor akTarget, Actor akCaster)
EndFunction