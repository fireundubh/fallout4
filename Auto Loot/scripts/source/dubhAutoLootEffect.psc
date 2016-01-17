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
				Int i = 0
				While i < LootArray.Length - 1
					ObjectReference objLoot = LootArray[i]

					; check if array item is null
					If objLoot != None

						; check if object is loaded, not disabled, and not in the player's inventory
						If objLoot.Is3DLoaded() && !objLoot.IsDisabled() && (Player.GetDistance(objLoot) > 1.0)

							; check if object is unowned
							If !Player.WouldBeStealing(objLoot)

								; max distance check
								If Player.GetDistance(objLoot) <= dubhAutoLootRadius.GetValue()

									; activate object
									objLoot.Activate(Player as ObjectReference, True)

								EndIf
							EndIf
						EndIf
					EndIf
					i += 1
				EndWhile
			EndIf
		EndIf
	EndWhile ; endwhile for main loop

EndFunction

Function OnEffectFinish(Actor akTarget, Actor akCaster)
EndFunction