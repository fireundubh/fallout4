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

; Unlock and reward XP based on lock level

Function UnlockForXP(ObjectReference objContainer)
	Bool bHasPerk = False

	Int iXPReward = 0
	Int iLockDifficulty = objContainer.GetLockLevel()

	If iLockDifficulty < 25
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardEasy") as Int ; 5 Base XP
		bHasPerk = True
	ElseIf iLockDifficulty >= 25 && iLockDifficulty < 50
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardEasy") as Int ; 5 Base XP
		bHasPerk = True
	ElseIf iLockDifficulty >= 50 && iLockDifficulty < 75
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardAverage") as Int ; 10 Base XP
		bHasPerk = PlayerRef.HasPerk(Locksmith01)
	ElseIf iLockDifficulty >= 75 && iLockDifficulty < 100
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardHard") as Int ; 15 Base XP
		bHasPerk = PlayerRef.HasPerk(Locksmith02)
	ElseIf iLockDifficulty >= 100
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardVeryHard") as Int ; 20 Base XP
		bHasPerk = PlayerRef.HasPerk(Locksmith03)
	EndIf

	If bHasPerk
		objContainer.Unlock(False)
		Game.RewardPlayerXP(iXPReward, False) ; True = No XP adjustments
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
						If kItem.GetItemCount(None) > 0
							Bool bLocked = kItem.IsLocked()

							If !bLocked || (bLocked && AutoLoot_Setting_UnlockContainers.Value == 1)
								AddObjectToObjectReferenceArray(kItem, kResult)
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

Function LootObject(ObjectReference objLoot)
	If (objLoot != None) && (DummyActor != None)
		If objLoot.IsLocked()
			If AutoLoot_Setting_UnlockContainers.Value == 1
				UnlockForXP(objLoot)
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
Formlist Property AutoLoot_FilterAll Auto
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
GlobalVariable Property AutoLoot_Setting_UnlockContainers Auto
GlobalVariable Property AutoLoot_Setting_LootSettlements Auto

; Misc.
Int Property TimerID Auto

; Perk
Perk Property ActivePerk Auto
Perk Property Locksmith01 Auto
Perk Property Locksmith02 Auto
Perk Property Locksmith03 Auto
