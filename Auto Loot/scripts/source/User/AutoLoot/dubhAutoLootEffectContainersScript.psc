ScriptName AutoLoot:dubhAutoLootEffectContainersScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] LootArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	StartTimer(dubhAutoLootDelay.Value as Int, dubhAutoLootTimer)
EndEvent

Event OnTimer(Int aiTimerID)
	; do not run if the player no longer has the perk
	If Player.HasPerk(dubhAutoLootPerk)

		; do not run if the location cannot be auto looted
		If CanAutoLootLocation()

			If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()
				LootArray = Player.FindAllReferencesOfType(dubhAutoLootFilter, dubhAutoLootRadius.Value)
				LootArray = FilterLootArray(LootArray)

				Log("OnTimer", "LootArray: " + LootArray)

				If (LootArray as Bool)
					If LootArray.Length > 0
						Int i = 0
						Bool bBreak = False
						While (i < LootArray.Length) && !bBreak

							If CheckIfLoopShouldExit()
								bBreak = True
							EndIf

							If !bBreak
								ObjectReference objLoot = LootArray[i]

								If objLoot != None
									; loot object if the item is not owned
									If (dubhAutoLootTheftAllowed.Value == False) && (Player.WouldBeStealing(objLoot) == False)
										If LootObject(objLoot)
											If dubhAutoLootToggleDelayOnLoot.Value == True
												Utility.Wait(dubhAutoLootDelay.Value as Int)
											EndIf
										EndIf
									ElseIf dubhAutoLootTheftAllowed.Value == True
										; remove ownership if option enabled
										If dubhAutoLootTheftAlarm.Value == False
											objLoot.SetActorRefOwner(Player)
										EndIf

										; loot object if the item is owned or unowned
										If LootObject(objLoot)
											If dubhAutoLootToggleDelayOnLoot.Value == True
												Utility.Wait(dubhAutoLootDelay.Value as Int)
											EndIf
										EndIf
									EndIf
								EndIf
							EndIf

							i += 1
						EndWhile
					EndIf
				EndIf

				LootArray.Clear()
			EndIf

		EndIf

		StartTimer(dubhAutoLootDelay.Value as Int, dubhAutoLootTimer)
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
;GlobalVariable Property dubhAutoLootTakeAll Auto
GlobalVariable Property dubhAutoLootTheftAllowed Auto
GlobalVariable Property dubhAutoLootTheftAlarm Auto
GlobalVariable Property dubhAutoLootTheftOnlyOwned Auto
GlobalVariable Property dubhAutoLootToggleDelayOnLoot Auto
GlobalVariable Property dubhAutoLootToggleUnlockContainers Auto
GlobalVariable Property dubhAutoLootWorkshopLooting Auto

; Formlists
Formlist Property dubhAutoLootFilter Auto
Formlist Property dubhAutoLootFilterAll Auto
Formlist Property dubhAutoLootLocations Auto
Formlist Property dubhAutoLootPerks Auto
Formlist Property dubhAutoLootSettlements Auto

; Perk
Perk Property dubhAutoLootPerk Auto
Perk Property Locksmith01 Auto
Perk Property Locksmith02 Auto
Perk Property Locksmith03 Auto

; Actor
Actor Property Player Auto
Actor Property dubhAutoLootDummyActor Auto

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

; Log

Function Log(String asFunction = "", String asMessage = "") DebugOnly
	Debug.TraceSelf(Self, asFunction, asMessage)
EndFunction

; Return true if exit condition met

Bool Function CheckIfLoopShouldExit()
	Return !Player.HasPerk(dubhAutoLootPerk) || Player.IsInCombat() || Utility.IsInMenuMode() || !Game.IsMovementControlsEnabled()
EndFunction

; Return true if all conditions are met

Bool Function CheckIfItemCanBeProcessed(ObjectReference akItem)
	Return akItem.Is3DLoaded() && !akItem.IsDisabled() && !akItem.IsDeleted() && !akItem.IsDestroyed() && !akItem.IsActivationBlocked()
EndFunction

; Unlock and reward XP based on lock level

Bool Function UnlockForXP(ObjectReference objContainer)
	Bool bHasPerk = False

	Int iXPReward = 0
	Int iLockDifficulty = objContainer.GetLockLevel()

	If iLockDifficulty < 25
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardEasy") as Int ; 5 Base XP
		bHasPerk = True
	ElseIf iLockDifficulty == 25
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardEasy") as Int ; 5 Base XP
		bHasPerk = True
	ElseIf iLockDifficulty == 50
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardAverage") as Int ; 10 Base XP
		bHasPerk = Player.HasPerk(Locksmith01)
	ElseIf iLockDifficulty == 75
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardHard") as Int ; 15 Base XP
		bHasPerk = Player.HasPerk(Locksmith02)
	ElseIf iLockDifficulty == 100
		iXPReward = Game.GetGameSettingFloat("fLockpickXPRewardVeryHard") as Int ; 20 Base XP
		bHasPerk = Player.HasPerk(Locksmith03)
	EndIf

	If bHasPerk
		Log("UnlockForXP", "Unlocking: " + objContainer)
		objContainer.Unlock(False)
		Log("UnlockForXP", "Rewarding XP: " + iXPReward)
		Game.RewardPlayerXP(iXPReward, False) ; True = No XP adjustments
		Return True
	EndIf

	Return False
EndFunction

; Filter Loot Array

ObjectReference[] Function FilterLootArray(ObjectReference[] akArray)
	ObjectReference[] kResult = new ObjectReference[0]

	If (akArray as Bool) && (akArray != None)
		Int i = akArray.Length - 1

		While i >= 0
			ObjectReference kItem = akArray[i]

			If kItem != None
				If CheckIfItemCanBeProcessed(kItem)
					If !kItem.IsLocked() || (dubhAutoLootToggleUnlockContainers.Value == True)
						If (kItem.GetItemCount() > 0) || kItem.IsLocked()
							If dubhAutoLootTheftOnlyOwned.Value == False
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

			i -= 1
		EndWhile
	EndIf

	Return kResult
EndFunction

; Returns true if loot in location can be processed

Bool Function CanAutoLootLocation()
	If dubhAutoLootWorkshopLooting.Value == False
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
		; do not run if the player no longer has the perk
		If Player.HasPerk(dubhAutoLootPerk)
			Bool bPlayerOnly = dubhAutoLootPlayerOnly.Value as Bool
			Int iContainer = dubhAutoLootContainer.Value as Int

			; determine where to send loot
			ObjectReference kContainer = None
			If (iContainer == 0) || (bPlayerOnly == True)
				kContainer = Player
			Else
				kContainer = (dubhAutoLootSettlements.GetAt(iContainer) as WorkshopScript) as ObjectReference
			EndIf

			If kContainer != None
				If objLoot.IsLocked() && (dubhAutoLootToggleUnlockContainers.Value == True)
					If UnlockForXP(objLoot)
						Log("LootObject", "Unlocked: " + objLoot)
					EndIf
				EndIf

				If !objLoot.IsLocked() ;&& (dubhAutoLootTakeAll.Value == True)
					objLoot.RemoveAllItems(kContainer, dubhAutoLootTheftAlarm.Value)
					Return True
				;ElseIf !objLoot.IsLocked() && (dubhAutoLootTakeAll.Value == False)
				;	If LootObjectByFilter(dubhAutoLootFilterAll, dubhAutoLootPerks, objLoot, kContainer)
				;		Return True
				;	EndIf
				EndIf
			EndIf
		EndIf
	EndIf

	Return False
EndFunction

; Loot specific items using active filters - excludes bodies and containers filters

;Bool Function LootObjectByFilter(Formlist akFilters, Formlist akPerks, ObjectReference akItem, ObjectReference akContainer)
;	If (akFilters as Bool) && (akPerks as Bool) && (akItem as Bool) && (akContainer as Bool)
;
;		Int i = 0
;		Bool bBreak = False
;
;		While (i < akFilters.GetSize()) && !bBreak
;			If CheckIfLoopShouldExit()
;				bBreak = True
;			EndIf
;
;			If !bBreak
;				If (i != 1) && (i != 2)
;					If Player.HasPerk(akPerks.GetAt(i) as Perk)
;						RemoveItems(akFilters.GetAt(i) as Formlist, akItem, akContainer)
;					EndIf
;				EndIf
;			EndIf
;
;			i += 1
;		EndWhile
;
;		Return True
;	EndIf
;
;	Return False
;EndFunction

; Iterates through loot in a container and removes specific items to another container

Bool Function RemoveItems(Formlist akFormlist, ObjectReference akContainer, ObjectReference akOtherContainer)
	Bool bItemsRemoved = False

	If (akFormlist as Bool) && (akContainer as Bool) && (akOtherContainer as Bool)
		Int i = 0
		Bool bBreak = False

		While (i < akFormlist.GetSize()) && !bBreak

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
