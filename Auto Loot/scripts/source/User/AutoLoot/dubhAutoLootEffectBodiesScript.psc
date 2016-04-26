ScriptName AutoLoot:dubhAutoLootEffectBodiesScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] LootArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	StartTimer(dubhAutoLootDelay.GetValueInt(), dubhAutoLootTimer)
EndEvent

Event OnTimer(Int aiTimerID)
	; get player
	Actor Player = Game.GetPlayer()

	; do not run if the player no longer has the perk
	If Player.HasPerk(dubhAutoLootPerk)

		; do not run if the location cannot be auto looted
		If CanAutoLootLocation()

			If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
				;LootArray = Player.FindAllReferencesWithKeyword(dubhAutoLootFilter, dubhAutoLootRadius.GetValue())
				LootArray = FindAllReferencesWithKeywordList(Player, dubhAutoLootFilter, dubhAutoLootRadius.GetValue())
				Log("OnTimer", "Instantiated(1): " + LootArray)

				LootArray = FilterLootArray(LootArray)
				Log("OnTimer", "Instantiated(2): " + LootArray)

				If (LootArray as Bool)
					If LootArray.Length > 0
						Int i = 0
						Bool bBreak = False
						While (i < LootArray.Length) && !bBreak

							If !Player.HasPerk(dubhAutoLootPerk) || Utility.IsInMenuMode() || !Game.IsMovementControlsEnabled()
								bBreak = True
							EndIf

							If !bBreak
								ObjectReference objLoot = LootArray[i]
								Log("OnTimer", "Iterating: " + objLoot)

								If objLoot != None
									; loot object if the item is not owned
									If (dubhAutoLootTheftAllowed.GetValue() == False) && (Player.WouldBeStealing(objLoot) == False)
										LootObject(objLoot)
									ElseIf dubhAutoLootTheftAllowed.GetValue() == True
										; remove ownership if option enabled
										If dubhAutoLootTheftAlarm.GetValue() == False
											objLoot.SetActorRefOwner(Player)
										EndIf

										; loot object if the item is owned or unowned
										LootObject(objLoot)
									EndIf
								EndIf
							EndIf

							i += 1
						EndWhile
					EndIf
				EndIf
			EndIf

		EndIf

		StartTimer(dubhAutoLootDelay.GetValueInt(), dubhAutoLootTimer)
	EndIf
EndEvent

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

; Misc.
Int Property dubhAutoLootTimer Auto

; Globals
GlobalVariable Property dubhAutoLootContainer Auto
GlobalVariable Property dubhAutoLootDelay Auto
GlobalVariable Property dubhAutoLootPlayerOnly Auto
GlobalVariable Property dubhAutoLootRadius Auto
GlobalVariable Property dubhAutoLootTakeAll Auto
GlobalVariable Property dubhAutoLootTheftAllowed Auto
GlobalVariable Property dubhAutoLootTheftAlarm Auto
GlobalVariable Property dubhAutoLootTheftOnlyOwned Auto
GlobalVariable Property dubhAutoLootWorkshopLooting Auto

; Formlists
Formlist Property dubhAutoLootFilter Auto
Formlist Property dubhAutoLootFilterAll Auto
Formlist Property dubhAutoLootLocations Auto
Formlist Property dubhAutoLootPerks Auto
Formlist Property dubhAutoLootSettlements Auto

; Perk
Perk Property dubhAutoLootPerk Auto

; Actor
Actor Property dubhAutoLootDummyActor Auto

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

; Log

Function Log(String asFunction = "", String asMessage = "") DebugOnly
	Debug.TraceSelf(Self, asFunction, asMessage)
EndFunction

; Filter Loot Array

ObjectReference[] Function FilterLootArray(ObjectReference[] akArray)
	ObjectReference[] kResult = new ObjectReference[0]

	If (akArray as Bool) && (akArray != None)
		Actor Player = Game.GetPlayer()

		Int i = 0
		While i < akArray.Length
			ObjectReference kItem = akArray[i]

			If kItem != None
				If (kItem as Actor) != Player
					If (kItem as Actor).IsDead() == True
						If kItem.GetItemCount() > 0
							If dubhAutoLootTheftOnlyOwned.GetValue() == False
									kResult.Add(kItem, 1)
							Else
								If Player.WouldBeStealing(kItem) == True
									kResult.Add(kItem, 1)
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf

			i += 1
		EndWhile
	EndIf

	Return kResult
EndFunction

ObjectReference[] Function FindAllReferencesWithKeywordList(ObjectReference akActor, Formlist akKeywords, Float afRadius)
	ObjectReference[] kResult = new ObjectReference[0]

	If (akActor as Bool) && (akKeywords as Bool) && (afRadius as Bool)
		Int i = 0
		While i < akKeywords.GetSize()
			ObjectReference[] tmpArray = akActor.FindAllReferencesWithKeyword(akKeywords.GetAt(i), afRadius)

			If tmpArray != None
				Int j = 0
				While j < tmpArray.Length
					kResult.Add(tmpArray[j])
					j += 1
				EndWhile
			EndIf

			i += 1
		EndWhile
	EndIf

	Return kResult
EndFunction

; Returns true if loot in location can be processed

Bool Function CanAutoLootLocation()
	If dubhAutoLootWorkshopLooting.GetValue() == False
		Form kLocation = Game.GetPlayer().GetCurrentLocation() as Form
		If dubhAutoLootLocations.HasForm(kLocation)
			Return False
		EndIf
	EndIf

	Return True
EndFunction

; Loot Object

Bool Function LootObject(ObjectReference objLoot)
	If (objLoot as Bool)
		; get player
		Actor Player = Game.GetPlayer()

		; do not run if the player no longer has the perk
		If Player.HasPerk(dubhAutoLootPerk)
			Int iContainer = dubhAutoLootContainer.GetValueInt() as Int

			; determine where to send loot
			ObjectReference kContainer = None
			If (iContainer == 0) || (dubhAutoLootPlayerOnly.GetValue() == True)
				kContainer = Player
			Else
				kContainer = (dubhAutoLootSettlements.GetAt(iContainer) as WorkshopScript) as ObjectReference
			EndIf

			If kContainer != None
				; handle non-player object as container
				; force dubhAutoLootDummyActor to activate the objLoot reference
				If kContainer != Player
					If dubhAutoLootTakeAll.GetValue() == True
						dubhAutoLootDummyActor.RemoveAllItems(kContainer, False)
						Return True
					Else
						If LootObjectByFilter(dubhAutoLootFilterAll, dubhAutoLootPerks, objLoot, kContainer)
							Return True
						EndIf
					EndIf
				; handle player object as container
				Else
					If dubhAutoLootTakeAll.GetValue() == True
						objLoot.RemoveAllItems(Player, False)
						Return True
					Else
						If LootObjectByFilter(dubhAutoLootFilterAll, dubhAutoLootPerks, objLoot, kContainer)
							Return True
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf

	Return False
EndFunction

; Loot specific items using active filters - excludes bodies and containers filters

Bool Function LootObjectByFilter(Formlist akFilters, Formlist akPerks, ObjectReference akItem, ObjectReference akContainer)
	If (akFilters as Bool) && (akPerks as Bool) && (akItem as Bool) && (akContainer as Bool)
		Actor Player = Game.GetPlayer()

		Int i = 0
		Bool bBreak = False
		While (i < akFilters.GetSize()) && !bBreak
			If Player.HasPerk(dubhAutoLootPerk) == False
				bBreak = True
			EndIf

			If !bBreak
				If (i != 1) && (i != 2)
					If Player.HasPerk(akPerks.GetAt(0) as Perk)
						RemoveItems(akFilters.GetAt(0) as Formlist, akItem, akContainer)
					EndIf
				EndIf
			EndIf

			i += 1
		EndWhile

		Return True
	EndIf

	Return False
EndFunction

; Iterates through loot in a container and removes specific items to another container

Bool Function RemoveItems(Formlist akFormlist, ObjectReference akContainer, ObjectReference akOtherContainer)
	Bool bItemsRemoved = False

	If (akFormlist as Bool) && (akContainer as Bool) && (akOtherContainer as Bool)
		Int i = 0
		Bool bBreak = False
		While (i < akFormlist.GetSize()) && !bBreak

			If Game.GetPlayer().HasPerk(dubhAutoLootPerk) == False
				bBreak = True
			EndIf

			If !bBreak
				Form objLoot = akFormlist.GetAt(i)
				Int lootCount = akContainer.GetItemCount(objLoot)

				If lootCount > 0
					akContainer.RemoveItem(objLoot, lootCount, False, akOtherContainer)
					bItemsRemoved = True
				EndIf
			EndIf

			i += 1
		EndWhile
	EndIf

	Return bItemsRemoved
EndFunction
