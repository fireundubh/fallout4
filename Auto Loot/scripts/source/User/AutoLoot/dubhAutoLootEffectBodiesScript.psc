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
	; do not run if the player no longer has the perk
	If Player.HasPerk(dubhAutoLootPerk)

		; do not run if the location cannot be auto looted
		If CanAutoLootLocation()

			If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
				Int i = 0
				Bool bBreak = False

				While i < dubhAutoLootFilter.GetSize() && !bBreak
					If CheckIfLoopShouldExit()
						bBreak = True
					EndIf

					If !bBreak
						LootArray = Player.FindAllReferencesWithKeyword(dubhAutoLootFilter.GetAt(i), dubhAutoLootRadius.GetValue())
						LootArray = FilterLootArray(LootArray)
						Loot(LootArray)
					EndIf

					i += 1
				EndWhile

				If LootArray.Length > 0
					LootArray.Clear()
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
GlobalVariable Property dubhAutoLootToggleDelayOnLoot Auto
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
Actor Property Player Auto
Actor Property dubhAutoLootDummyActor Auto

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

; Return true if exit condition met

Bool Function CheckIfLoopShouldExit()
	Return !Player.HasPerk(dubhAutoLootPerk) || Player.IsInCombat() || Utility.IsInMenuMode() || !Game.IsMovementControlsEnabled()
EndFunction

; Return true if all conditions are met

Bool Function CheckIfItemCanBeProcessed(ObjectReference akItem)
	Return akItem.Is3DLoaded() && !akItem.IsDisabled() && !akItem.IsDeleted() && !akItem.IsDestroyed() && !akItem.IsActivationBlocked()
EndFunction

; Iterate and Loot

Function Loot(ObjectReference[] akLootArray)
	If (akLootArray as Bool)
		Int iLootArray = akLootArray.Length

		If iLootArray > 0
			Int i = 0
			Bool bBreak = False

			While (i < iLootArray) && !bBreak
				If CheckIfLoopShouldExit()
					bBreak = True
				EndIf

				If !bBreak
					ObjectReference objLoot = akLootArray[i]

					If objLoot != None
						; loot object if the item is not owned
						If (dubhAutoLootTheftAllowed.GetValue() == False) && (Player.WouldBeStealing(objLoot) == False)
							If LootObject(objLoot)
								If dubhAutoLootToggleDelayOnLoot.GetValue() == True
									Utility.Wait(dubhAutoLootDelay.GetValueInt())
								EndIf
							EndIf
						ElseIf dubhAutoLootTheftAllowed.GetValue() == True
							; remove ownership if option enabled
							If dubhAutoLootTheftAlarm.GetValue() == False
								objLoot.SetActorRefOwner(Player)
							EndIf

							; loot object if the item is owned or unowned
							If LootObject(objLoot)
								If dubhAutoLootToggleDelayOnLoot.GetValue() == True
									Utility.Wait(dubhAutoLootDelay.GetValueInt())
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf

				i += 1
			EndWhile

			akLootArray.Clear()
		EndIf
	EndIf
EndFunction

; Filter Loot Array

Function AddObjectToObjectReferenceArray(ObjectReference akContainer, ObjectReference[] akArray)
	If akContainer.GetItemCount() > 0
		If dubhAutoLootTheftOnlyOwned.GetValue() == False
			akArray.Add(akContainer, 1)
		ElseIf Player.WouldBeStealing(akContainer) == True
			akArray.Add(akContainer, 1)
		EndIf
	EndIf
EndFunction

ObjectReference[] Function FilterLootArray(ObjectReference[] akArray)
	ObjectReference[] kResult = new ObjectReference[0]

	If (akArray as Bool) && (akArray != None)
		Int i = 0

		While i < akArray.Length
			ObjectReference kItem = akArray[i]

			If kItem != None
				If CheckIfItemCanBeProcessed(kItem)
					Actor kItemAsActor = kItem as Actor

					If (kItemAsActor != None) && (kItemAsActor != Player)
						If kItemAsActor.IsDead()
							AddObjectToObjectReferenceArray(kItem, kResult)
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
		Int iKeywords = akKeywords.GetSize()

		While i < iKeywords
			Keyword kKeyword = akKeywords.GetAt(i) as Keyword
			ObjectReference[] tmpArray = akActor.FindAllReferencesWithKeyword(kKeyword, afRadius)

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

Bool Function LootObject(ObjectReference objContainer)
	If (objContainer as Bool)

		; do not run if the player no longer has the perk
		If Player.HasPerk(dubhAutoLootPerk)
			Bool bPlayerOnly = dubhAutoLootPlayerOnly.GetValue() as Bool
			Int iContainer = dubhAutoLootContainer.GetValueInt() as Int

			; determine where to send loot
			ObjectReference kOtherContainer = None
			If (iContainer == 0) || (bPlayerOnly == True)
				kOtherContainer = Player
			Else
				kOtherContainer = (dubhAutoLootSettlements.GetAt(iContainer) as WorkshopScript) as ObjectReference
			EndIf

			; send loot to the other container
			If kOtherContainer != None
				Debug.Trace("Trying to loot: " + objContainer)
				If dubhAutoLootTakeAll.GetValue() == True
					objContainer.RemoveAllItems(kOtherContainer, dubhAutoLootTheftAlarm.GetValue())
					Return True
				Else
					LootObjectByFilter(dubhAutoLootFilterAll, dubhAutoLootPerks, objContainer, kOtherContainer)
					Return True
				EndIf
			EndIf
		EndIf
	EndIf

	Return False
EndFunction

; Loot specific items using active filters - excludes bodies and containers filters

Bool Function LootObjectByFilter(Formlist akFilters, Formlist akPerks, ObjectReference akItem, ObjectReference akOtherContainer)
	If (akFilters as Bool) && (akPerks as Bool) && (akItem as Bool) && (akOtherContainer as Bool)
		Int i = 0
		Int iFilters = akFilters.GetSize()
		Bool bBreak = False

		While (i < iFilters) && !bBreak
			If CheckIfLoopShouldExit()
				bBreak = True
			EndIf

			If !bBreak
				If (i != 1) && (i != 2)
					Perk kPerk = akPerks.GetAt(i) as Perk
					If Player.HasPerk(kPerk)
						Formlist kFilter = akFilters.GetAt(i) as Formlist
						RemoveItems(kFilter, akItem, akOtherContainer)
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
		Int iForms = akFormlist.GetSize()
		Bool bBreak = False

		While (i < iForms) && !bBreak
			If CheckIfLoopShouldExit()
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
