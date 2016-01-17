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

		; restore loot list to defaults - this was needed in skyrim to prevent a null error
		dubhAutoLootFilter.Revert()

		; create an array of loot references in the defined global radius with the player at the center
		ObjectReference[] LootArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, dubhAutoLootRadius.GetValue())

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
						If objLoot.Is3DLoaded() && !objLoot.IsDisabled()
							If objLoot != None
								If (Player.GetDistance(objLoot) > 1.0)
									If objLoot != None
										If !Player.WouldBeStealing(objLoot)
											If objLoot != None
												If Player.GetDistance(objLoot) <= dubhAutoLootRadius.GetValue()
													If objLoot != None
														objLoot.Activate(Player as ObjectReference, True)
													EndIf ; None
												EndIf ; GetDistance
											EndIf ; None
										EndIf ; WouldBeStealing
									EndIf ; None
								EndIf ; GetDistance
							EndIf ; None
						EndIf ; Is3DLoaded, IsDisabled
					EndIf ; None
					i += 1
				EndWhile ; loot array loop
			EndIf ; loot array length
		EndIf ; loot array none
	EndWhile ; endwhile for main loop

EndFunction

Function OnEffectFinish(Actor akTarget, Actor akCaster)
EndFunction