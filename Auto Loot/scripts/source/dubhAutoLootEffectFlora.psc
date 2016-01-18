ScriptName dubhAutoLootEffectFlora Extends ActiveMagicEffect

Perk Property dubhAutoLootPerk Auto

Formlist Property dubhAutoLootFilter Auto

Formlist Property dubhAutoLootSkip Auto

GlobalVariable Property dubhAutoLootRadius Auto

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: dubhAutoLootEffectFlora> " + msgTrace, 0)
EndFunction

Function OnEffectStart(Actor akTarget, Actor akCaster)

	Actor Player = Game.GetPlayer()

	Float fFirstLootTime = -1.0

	; main loop
	While Player.HasPerk(dubhAutoLootPerk)

		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()

			; get the cell reset time as a float - this is in main loop so changing the setting in game will affect loop
			Float fCellResetTime = Game.GetGameSettingInt("iHoursToRespawnCell") as Float

			; restore loot list to defaults - this was needed in skyrim to prevent a null error
			dubhAutoLootFilter.Revert()

			; create an array of loot references in the defined global radius with the player at the center
			ObjectReference[] LootArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, dubhAutoLootRadius.GetValue())

			If LootArray != None

				; check if the loot array has items
				If LootArray.Length > 0

					; loot array loop
					Int i = 0
					While i < LootArray.Length

						; check if array item is not null
						If LootArray[i] != None

							; check if we can clear the skip list
							If fFirstLootTime > -1.0
								If Utility.GetCurrentGameTime() >= (fCellResetTime+fFirstLootTime)
									dubhAutoLootSkip.Revert()
									fFirstLootTime = -1.0
								EndIf
							EndIf

							; filter the loot array using the skip list
							If dubhAutoLootSkip.GetSize() > 0
								If dubhAutoLootSkip.HasForm(LootArray[i] as Form)
									LootArray[i] = None
								EndIf
							EndIf

							ObjectReference objLoot = LootArray[i]

							; check if object is null
							If objLoot != None

								; check if object is not disabled and not destroyed
								If objLoot.Is3DLoaded() && !objLoot.IsDisabled() && !objLoot.IsDestroyed() && (Player.GetDistance(objLoot) > 1.0)

									; check if object is unowned
									If !Player.WouldBeStealing(objLoot)

										; max distance check
										If Player.GetDistance(objLoot) <= dubhAutoLootRadius.GetValue()

											; activate object
											If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
												If objLoot.Activate(Player as ObjectReference, True)
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
							EndIf
						EndIf
						i += 1
					EndWhile
				EndIf
			EndIf
		EndIf
	EndWhile ; endwhile for main loop

EndFunction

Function OnEffectFinish(Actor akTarget, Actor akCaster)
EndFunction