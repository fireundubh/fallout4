ScriptName AutoLoot:dubhAutoLootEffectBodiesScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

ObjectReference[] LootArray = None

Event OnEffectStart(Actor akTarget, Actor akCaster)
	StartTimer(Delay.Value as Int, TimerID as Int)
EndEvent

Event OnTimer(Int aiTimerID)
	If PlayerRef.HasPerk(ActivePerk)
		If LocationCanBeLooted()
			If GameStateIsValid()
				Int i = 0
				Bool bBreak = False

				While (i < Filter.GetSize()) && !bBreak
					If !GameStateIsValid()
						bBreak = True
					EndIf

					If !bBreak
						LootArray = PlayerRef.FindAllReferencesWithKeyword(Filter.GetAt(i), Radius.Value as Float)

						If LootArray != None
							LootArray = FilterLootArray(LootArray)

							If LootArray != None
								Loot(LootArray)
							EndIf
						EndIf
					EndIf

					i += 1
				EndWhile

				If LootArray != None
					LootArray.Clear()
				EndIf
			EndIf
		EndIf

		StartTimer(Delay.Value as Int, TimerID)
	EndIf
EndEvent

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

; Log

Function Log(String asFunction = "", String asMessage = "") DebugOnly
	Debug.TraceSelf(Self, asFunction, asMessage)
EndFunction

; Return true if any exit condition met

Bool Function GameStateIsValid()
	If PlayerRef.HasPerk(ActivePerk) && !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled() && !Game.IsVATSPlaybackActive()
		Return True
	EndIf

	Return False
EndFunction

; Return true if all conditions are met

Bool Function ItemCanBeProcessed(ObjectReference akItem)
	If akItem.Is3DLoaded() && !akItem.IsDisabled() && !akItem.IsDeleted() && !akItem.IsDestroyed() && !akItem.IsActivationBlocked()
		Return True
	EndIf

	Return False
EndFunction

; Disables the container when container is empty

Function TryToDisableBody(ObjectReference akContainer)
	If AutoLoot_Setting_RemoveBodiesOnLoot.Value == 1
		If akContainer.GetItemCount(None) == 0
			akContainer.DisableNoWait()
			akContainer.Delete()
		EndIf
	EndIf
EndFunction

; Iterate and Loot

Function Loot(ObjectReference[] akLootArray)
	If akLootArray.Length > 0
		Int i = 0
		Bool bBreak = False

		While (i < akLootArray.Length) && !bBreak
			If !GameStateIsValid()
				bBreak = True
			EndIf

			If !bBreak
				ObjectReference objLoot = akLootArray[i] as ObjectReference

				If objLoot != None
					If PlayerRef.WouldBeStealing(objLoot)
						If (AutoLoot_Setting_AllowStealing.Value == 1) && (AutoLoot_Setting_StealingIsHostile.Value == 0)
							objLoot.SetActorRefOwner(PlayerRef)
						EndIf
					EndIf

					LootObject(objLoot)
				EndIf
			EndIf

			i += 1
		EndWhile

		akLootArray.Clear()
	EndIf
EndFunction

; Filter Loot Array

Function AddObjectToObjectReferenceArray(ObjectReference akContainer, ObjectReference[] akArray)
  If AutoLoot_Setting_LootOnlyOwned.Value == 1
  	If PlayerRef.WouldBeStealing(akContainer)
  		akArray.Add(akContainer, 1)
  	EndIf
	Else
		akArray.Add(akContainer, 1)
	EndIf
EndFunction

ObjectReference[] Function FilterLootArray(ObjectReference[] akArray)
	ObjectReference[] kResult = new ObjectReference[0]

	If akArray.Length > 0
		Int i = akArray.Length - 1
		Bool bBreak = False

		While (i >= 0) && !bBreak
			If kResult.Length >= 128
				bBreak = True
			EndIf

			If !GameStateIsValid()
				bBreak = True
			EndIf

			If !bBreak
			ObjectReference kItem = akArray[i] as ObjectReference

				If kItem != None
					If ItemCanBeProcessed(kItem)
						Actor kActor = kItem as Actor

						If (kActor != None) && (kActor != PlayerRef)
							If kActor.IsDead()
								If kItem.GetItemCount(None) > 0
									AddObjectToObjectReferenceArray(kItem, kResult)
								Else
									TryToDisableBody(kItem)
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf

			i -= 1
		EndWhile
	EndIf

	Return kResult
EndFunction

ObjectReference[] Function FindAllReferencesWithKeywordList(ObjectReference akActor, Formlist akKeywords, Float afRadius)
	ObjectReference[] kResult = new ObjectReference[0]

	Int i = 0
	Int iKeywords = akKeywords.GetSize()
	Bool bBreak = False

	While (i < iKeywords) && !bBreak
		If kResult.Length >= 128
			bBreak = True
		EndIf

		If !GameStateIsValid()
			bBreak = True
		EndIf

		If !bBreak
			Keyword kKeyword = akKeywords.GetAt(i) as Keyword
			ObjectReference[] tmpArray = akActor.FindAllReferencesWithKeyword(kKeyword, afRadius)

			If tmpArray != None
				Int j = 0
				Bool bBreakTmp = False

				While (j < tmpArray.Length) && !bBreakTmp
					If kResult.Length >= 128
						bBreakTmp = True
					EndIf

					If !bBreakTmp
						kResult.Add(tmpArray[j])
					EndIf

					j += 1
				EndWhile
			EndIf
		EndIf

		i += 1
	EndWhile

	Return kResult
EndFunction

; Returns true if loot in location can be processed

Bool Function LocationCanBeLooted()
	If AutoLoot_Setting_LootSettlements.Value == 0
		Form kLocation = PlayerRef.GetCurrentLocation() as Form

		If AutoLoot_Locations.HasForm(kLocation)
			Return False
		EndIf
	EndIf

	Return True
EndFunction

; Loot Object

Function LootObject(ObjectReference objContainer)
	If (objContainer != None) && (DummyActor != None)
		If AutoLoot_Setting_TakeAll.Value == 1
			objContainer.RemoveAllItems(DummyActor, AutoLoot_Setting_StealingIsHostile.Value)
		Else
			LootObjectByFilter(FilterAll, AutoLoot_Perks, objContainer, DummyActor)
		EndIf

		TryToDisableBody(objContainer)
	EndIf
EndFunction

; Loot specific items using active filters - excludes bodies and containers filters

Bool Function LootObjectByFilter(Formlist akFilters, Formlist akPerks, ObjectReference akContainer, ObjectReference akOtherContainer)
	Int i = 0
	Bool bBreak = False

	While (i < akFilters.GetSize()) && !bBreak
		If !GameStateIsValid()
			bBreak = True
		EndIf

		If !bBreak
			If (i != 2) && (i != 4)
				If PlayerRef.HasPerk(akPerks.GetAt(i) as Perk)
					Formlist kFilter = akFilters.GetAt(i) as Formlist
					akContainer.RemoveItem(kFilter, -1, True, akOtherContainer)
				EndIf
			EndIf
		EndIf

		i += 1
	EndWhile
EndFunction

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

; Actor
Actor Property PlayerRef Auto
Actor Property DummyActor Auto

; Formlists
Formlist Property Filter Auto
Formlist Property FilterAll Auto
Formlist Property AutoLoot_Locations Auto
Formlist Property AutoLoot_Perks Auto

; Globals
GlobalVariable Property Destination Auto
GlobalVariable Property Delay Auto
GlobalVariable Property Radius Auto
GlobalVariable Property AutoLoot_Setting_TakeAll Auto
GlobalVariable Property AutoLoot_Setting_AllowStealing Auto
GlobalVariable Property AutoLoot_Setting_StealingIsHostile Auto
GlobalVariable Property AutoLoot_Setting_LootOnlyOwned Auto
GlobalVariable Property AutoLoot_Setting_RemoveBodiesOnLoot Auto
GlobalVariable Property AutoLoot_Setting_LootSettlements Auto

; Misc.
Int Property TimerID Auto

; Perk
Perk Property ActivePerk Auto
