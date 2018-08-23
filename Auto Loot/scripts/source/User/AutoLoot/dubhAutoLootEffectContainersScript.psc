ScriptName AutoLoot:dubhAutoLootEffectContainersScript Extends ActiveMagicEffect

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
				LootArray = PlayerRef.FindAllReferencesOfType(Filter, Radius.Value as Float)

				If LootArray != None
					LootArray = FilterLootArray(LootArray)

					If LootArray != None
						If LootArray.Length > 0
							Int i = 0
							Bool bBreak = False

							While (i < LootArray.Length) && !bBreak
								If !GameStateIsValid()
									bBreak = True
								EndIf

								If !bBreak
									ObjectReference objLoot = LootArray[i] as ObjectReference

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
						EndIf
					EndIf
				EndIf

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
	Return PlayerRef.HasPerk(ActivePerk) && !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled() && !Game.IsVATSPlaybackActive()
EndFunction

; Return true if all conditions are met

Bool Function ItemCanBeProcessed(ObjectReference akItem)
	Return akItem.Is3DLoaded() && !akItem.IsDisabled() && !akItem.IsDeleted() && !akItem.IsDestroyed() && !akItem.IsActivationBlocked()
EndFunction

; Check if player has a lockpicking perk - uses formlist to support other mods

Bool Function PlayerCanPickLock()
	Int i = 0
	Bool bBreak = False

	While (i < AutoLoot_Perks_Lockpicking.GetSize()) && !bBreak
		If !GameStateIsValid()
			bBreak = True
		EndIf

		If !bBreak
			If PlayerRef.HasPerk(AutoLoot_Perks_Lockpicking.GetAt(i) as Perk)
				Return True
			EndIf
		EndIf

		i += 1
	EndWhile

	Return False
EndFunction

; Unlock and reward XP based on lock level

Bool Function TryToUnlockForXP(ObjectReference objContainer)
	Int iXPReward = 0
	Int iLockDifficulty = objContainer.GetLockLevel()

	If iLockDifficulty < 50
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardEasy") as Int ; 5 Base XP
	ElseIf iLockDifficulty >= 50 && iLockDifficulty < 75
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardAverage") as Int ; 10 Base XP
	ElseIf iLockDifficulty >= 75 && iLockDifficulty < 100
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardHard") as Int ; 15 Base XP
	ElseIf iLockDifficulty >= 100
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardVeryHard") as Int ; 20 Base XP
	EndIf

	If iLockDifficulty < 50 || PlayerCanPickLock()
		objContainer.Unlock(False)
		Game.RewardPlayerXP(iXPReward, False)

		Return True
	EndIf

	Return False
EndFunction

; Adds an object reference to the filtered loot array

Function AddObjectToObjectReferenceArray(ObjectReference akContainer, ObjectReference[] akArray)
	; exclude quest items that are explicitly excluded
	If QuestItems.GetSize() > 0
		If QuestItems.HasForm(akContainer as Form)
			Return
		EndIf
	EndIf

  ; do not add items in locked containers when Auto Lockpick is disabled
  If AutoLoot_Setting_UnlockContainers.Value == 0
  	If akContainer.IsLocked()
  		Return
  	EndIf
  EndIf

	; add only owned items when Auto Steal is enabled and mode is set to Owned Only
  If AutoLoot_Setting_AllowStealing.Value == 1 && AutoLoot_Setting_LootOnlyOwned.Value == 1
  	If PlayerRef.WouldBeStealing(akContainer)
  		akArray.Add(akContainer, 1)
  		Return
  	EndIf
  EndIf

	; add all items when Auto Steal is enabled and mode is set to Owned and Unowned
	If AutoLoot_Setting_AllowStealing.Value == 1
		akArray.Add(akContainer, 1)
		Return
	EndIf

	; finally, add only unowned items if the above conditions are not met
	If !PlayerRef.WouldBeStealing(akContainer)
		akArray.Add(akContainer, 1)
	EndIf
EndFunction

; Filters the loot array for valid items

ObjectReference[] Function FilterLootArray(ObjectReference[] akArray)
	ObjectReference[] kResult = new ObjectReference[0]

	If akArray.Length > 0
		Int i = 0
		Bool bBreak = False

		While (i < akArray.Length) && !bBreak
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
						If kItem.GetItemCount(None) > 0
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

; Returns true if loot in location can be processed

Bool Function LocationCanBeLooted()
	If AutoLoot_Setting_LootSettlements.Value == 1
		Return True
	EndIf

	Return !AutoLoot_Locations.HasForm(PlayerRef.GetCurrentLocation() as Form)
EndFunction

; Loot Object

Function LootObject(ObjectReference objLoot)
	If (objLoot != None) && (DummyActor != None)
		If objLoot.IsLocked()
			If !TryToUnlockForXP(objLoot)
				Return
			EndIf
		EndIf

		If AutoLoot_Setting_TakeAll.Value == 1
			objLoot.RemoveAllItems(DummyActor, AutoLoot_Setting_StealingIsHostile.Value)
		Else
			LootObjectByFilter(AutoLoot_FilterAll, AutoLoot_Perks, objLoot, DummyActor)
		EndIf
	EndIf
EndFunction

; Loot specific items using active filters - excludes bodies and containers filters

Function LootObjectByFilter(Formlist akFilters, Formlist akPerks, ObjectReference akContainer, ObjectReference akOtherContainer)
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
Formlist Property QuestItems Auto
Formlist Property AutoLoot_FilterAll Auto
Formlist Property AutoLoot_Locations Auto
Formlist Property AutoLoot_Perks Auto
Formlist Property AutoLoot_Perks_Lockpicking Auto

; Globals
GlobalVariable Property Destination Auto
GlobalVariable Property Delay Auto
GlobalVariable Property Radius Auto
GlobalVariable Property AutoLoot_Setting_TakeAll Auto
GlobalVariable Property AutoLoot_Setting_AllowStealing Auto
GlobalVariable Property AutoLoot_Setting_StealingIsHostile Auto
GlobalVariable Property AutoLoot_Setting_LootOnlyOwned Auto
GlobalVariable Property AutoLoot_Setting_UnlockContainers Auto
GlobalVariable Property AutoLoot_Setting_LootSettlements Auto

; Misc.
Int Property TimerID Auto

; Perk
Perk Property ActivePerk Auto
