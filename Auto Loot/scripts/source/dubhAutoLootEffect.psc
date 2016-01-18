ScriptName dubhAutoLootEffect Extends ActiveMagicEffect

Perk Property dubhAutoLootPerk Auto

Formlist Property dubhAutoLootFilter Auto

GlobalVariable Property dubhAutoLootRadius Auto

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: dubhAutoLootEffect> " + msgTrace, 0)
EndFunction

Function OnEffectStart(Actor akTarget, Actor akCaster)

	Actor Player = Game.GetPlayer()

	; main loop
	While Player.HasPerk(dubhAutoLootPerk)

		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()

			; get auto loot radius at start of loop to reduce lookups
			Float AutoLootRadius = dubhAutoLootRadius.GetValue()

			; restore loot list to defaults - this was needed in skyrim to prevent a null error
			dubhAutoLootFilter.Revert()

			; create an array of loot references in the defined global radius with the player at the center
			ObjectReference[] LootArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, AutoLootRadius)

			; check of array is null
			If LootArray != None

				; check if the loot array has items
				If LootArray.Length > 0

					; loot array loop
					; note: the reason for multiple redundant none checks is because things can happen
					; between the if statements in real time that remove the objects from the cell
					Int i = 0
					While i < LootArray.Length - 1
						ObjectReference objLoot = LootArray[i]
						If objLoot != None
							If objLoot.Is3DLoaded()
								;Log(objLoot + " has loaded 3D.")
								If objLoot != None
									If !objLoot.IsDisabled()
										;Log(objLoot + " is not disabled.")
										If objLoot != None
											If objLoot.GetContainer() == None
												;Log(objLoot + " is not in a container.")
												If objLoot != None
													If objLoot.IsOwnedBy(Player) || !Player.WouldBeStealing(objLoot)
														;Log(objLoot + " is unowned or owned by the player.")
														If objLoot != None
															If Player.GetDistance(objLoot) <= AutoLootRadius
																;Log(objLoot + " is within the auto loot radius.")
																If objLoot != None
																	If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
																		If objLoot.Activate(Player, True)
																			;Log(objLoot + " has been looted.")
																		EndIf
																	EndIf
																EndIf ; None
															EndIf ; GetDistance
														EndIf ; None
													EndIf ; WouldBeStealing
												EndIf ; None
											EndIf ; GetContainer
										EndIf ; None
									EndIf ; IsDisabled
								EndIf ; None
							EndIf ; Is3DLoaded
						EndIf ; None
						i += 1
					EndWhile ; loot array loop
				EndIf ; loot array length
			EndIf ; loot array none
		EndIf ; endif for IsInMenuMode
	EndWhile ; endwhile for main loop

EndFunction

Function OnEffectFinish(Actor akTarget, Actor akCaster)
EndFunction