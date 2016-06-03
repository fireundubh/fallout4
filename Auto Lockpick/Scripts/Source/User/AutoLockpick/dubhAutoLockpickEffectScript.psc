ScriptName AutoLockpick:dubhAutoLockpickEffectScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

ObjectReference[] ContainerArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	StartTimer(dubhAutoLockpickDelay.Value, 1337)
EndEvent

Event OnTimer(Int aiTimerID)
	If Player.HasPerk(dubhAutoLockpickPerk)

		If !Utility.IsInMenuMode() && Game.IsMovementControlsEnabled()

			If (dubhAutoLockpickSneakOnly.Value == False) || (Player.IsSneaking() && (dubhAutoLockpickSneakOnly.Value == True))

				If Player.GetItemCount(BobbyPin) > 0

					ContainerArray = Player.FindAllReferencesOfType(dubhAutoLockpickFilter, dubhAutoLockpickRadius.Value)
					ContainerArray = FilterArray(ContainerArray)

					If ContainerArray

						If ContainerArray.Length > 0

							Int i = 0
							Bool bBreak = False

							While (i < ContainerArray.Length) && !bBreak

								If CheckIfLoopShouldExit()
									bBreak = True
								EndIf

								If !bBreak
									ObjectReference objLoot = ContainerArray[i]

									If objLoot
										If UnlockForXP(objLoot)
											If (dubhAutoLockpickTakeAll.Value == True)
												objLoot.RemoveAllItems(Player, False) ; does not output error for doors, yay
											EndIf
										EndIf
									EndIf
								EndIf

								i += 1
							EndWhile

						EndIf

					EndIf

				EndIf

			EndIf

		EndIf

		StartTimer(dubhAutoLockpickDelay.Value, 1337)
	EndIf
EndEvent

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

; Globals
GlobalVariable Property dubhAutoLockpickDelay Auto
GlobalVariable Property dubhAutoLockpickRadius Auto
GlobalVariable Property dubhAutoLockpickSneakOnly Auto
GlobalVariable Property dubhAutoLockpickTakeAll Auto

; Formlists
Formlist Property dubhAutoLockpickFilter Auto

; MiscObject
MiscObject Property BobbyPin Auto

; Perk
Perk Property dubhAutoLockpickPerk Auto
Perk Property Locksmith01 Auto
Perk Property Locksmith02 Auto
Perk Property Locksmith03 Auto

; Actor
Actor Property Player Auto

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

; Log

Function Log(String asFunction = "", String asMessage = "") DebugOnly
	Debug.TraceSelf(Self, asFunction, asMessage)
EndFunction

; Return true if exit condition met

Bool Function CheckIfLoopShouldExit()
	Return !Player.HasPerk(dubhAutoLockpickPerk) || Player.IsInCombat() || Utility.IsInMenuMode() || !Game.IsMovementControlsEnabled()
EndFunction

; Return true if all conditions are met

Bool Function CheckIfItemCanBeProcessed(ObjectReference akItem)
	Return akItem.Is3DLoaded() && !akItem.IsDisabled() && !akItem.IsDeleted() && !akItem.IsDestroyed() && !akItem.IsActivationBlocked()
EndFunction

; Unlock and reward XP based on lock level

Bool Function UnlockForXP(ObjectReference objContainer)
	If Player.GetItemCount(BobbyPin) > 0
		Bool bHasPerk = False

		Int iXPReward = 0
		Int iLockDifficulty = objContainer.GetLockLevel()

		If iLockDifficulty <= 25
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
			objContainer.Unlock(False)
			Player.RemoveItem(BobbyPin, 1)
			Game.RewardPlayerXP(iXPReward, False) ; True = No XP adjustments
			Return True
		EndIf
	EndIf
	Return False
EndFunction

; Filter Loot Array

ObjectReference[] Function FilterArray(ObjectReference[] akArray)
	If akArray
		Bool bLocksmith01 = Player.HasPerk(Locksmith01)
		Bool bLocksmith02 = Player.HasPerk(Locksmith02)
		Bool bLocksmith03 = Player.HasPerk(Locksmith03)

		ObjectReference[] kResult = new ObjectReference[0]

		Int i = 0

		While i < akArray.Length
			ObjectReference kItem = akArray[i]

			If kItem != None
				If CheckIfItemCanBeProcessed(kItem)
					If kItem.IsLocked()
						Int iLockDifficulty = kItem.GetLockLevel()

						If (iLockDifficulty <= 25) || (bLocksmith01 && (iLockDifficulty <= 50)) || (bLocksmith01 && (iLockDifficulty <= 50)) || (bLocksmith02 && (iLockDifficulty <= 75)) || (bLocksmith03 && (iLockDifficulty <= 100))
							kResult.Add(kItem, 1)
						EndIf
					EndIf
				EndIf
			EndIf

			i += 1
		EndWhile

		Return kResult
	EndIf

	Return None
EndFunction