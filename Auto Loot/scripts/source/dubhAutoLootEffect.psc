ScriptName dubhAutoLootEffect Extends ActiveMagicEffect

Formlist Property dubhAutoLootList Auto

Formlist Property dubhAutoLootSkip Auto

GlobalVariable Property dubhAutoLootRadius Auto

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: dubhAutoLootEffect> " + msgTrace, 0)
EndFunction

Function OnEffectStart(Actor akTarget, Actor akCaster)

	Actor Player = Game.GetPlayer()

	Float fFirstLootTime = -1.0

	; main loop
	While True

		; get the cell reset time as a float - this is in main loop so changing the setting in game will affect loop
		Float fCellResetTime = Game.GetGameSettingInt("iHoursToRespawnCell") as Float

		; create an array of loot references in the defined global radius with the player at the center
		ObjectReference[] LootArray = Player.FindAllReferencesOfType(dubhAutoLootList, dubhAutoLootRadius.GetValue())

		; restore loot list to defaults - this was needed in skyrim to prevent a null error
		dubhAutoLootList.Revert()

		; check if the loot array has items
		If LootArray.Length > 0

			Int i = 0

			; loot array loop
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

					; continue in loop if we need to skip
					If LootArray[i] != None
						ObjectReference objLoot = LootArray[i] as ObjectReference

						; check if object is not disabled and not destroyed
						If !objLoot.IsDisabled() && !objLoot.IsDestroyed()

							; check if object is unowned
							If Player.IsOwner(objLoot) || ((objLoot.GetFactionOwner() == None) && (objLoot.GetActorOwner() == None) && (objLoot.GetActorRefOwner() == None))

								; check if object is not inheriting cell ownership
								Cell pCell = objLoot.GetParentCell()
								If (pCell.GetFactionOwner() == None) && (pCell.GetActorOwner() == None)

									; activate object
									If objLoot.Activate(Player as ObjectReference, True)
										;Log("Activated: " + objLoot)

										; add form to filter
										dubhAutoLootSkip.AddForm(objLoot)

										; track the time of the first auto looted object
										; important: the skip list will be reset when the first object on the list was last looted before fCellResetTime
										If fFirstLootTime < 0
											fFirstLootTime = Utility.GetCurrentGameTime()
										EndIf

									EndIf ; endif for activate object

								EndIf ; endif for cell ownership check

							EndIf ; endif for object ownership check

						EndIf ; endif for disabled/destroyed check

					EndIf ; endif for arbitrary null check

				EndIf ; endif for base null check

				i += 1

			EndWhile ; endwhile for loot array loop

		EndIf ; endif for loot array length check

	EndWhile ; endwhile for main loop

EndFunction