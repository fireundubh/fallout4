ScriptName AutoLoot:dubhAutoLootEffectComponentsScript Extends ActiveMagicEffect

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
		MiscObject akMisc = akItem.GetBaseObject() as MiscObject

		If ItemHasLootableComponent(akMisc)
			Return True
		EndIf
	EndIf

	Return False
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
					ObjectReference kContainer = kItem.GetContainer() as ObjectReference

					If (kContainer == None) && (kContainer != PlayerRef)
						If ItemCanBeProcessed(kItem)
							AddObjectToObjectReferenceArray(kItem, kResult)
						EndIf
					EndIf
				EndIf
			EndIf

			i -= 1
		EndWhile
	EndIf

	Return kResult
EndFunction

; Returns item if item has a lootable component, or None if not

Bool Function ItemHasLootableComponent(MiscObject akItem)
	Int i = 0
	Bool bBreak = False

	; Loop through global formlist
	While (i < AutoLoot_Globals_Components.GetSize()) && !bBreak
		If !GameStateIsValid()
			bBreak = True
		EndIf

		If !bBreak
			GlobalVariable componentState = AutoLoot_Globals_Components.GetAt(i) as GlobalVariable

			; If the component is preferred, and akItem has that component, return True
			If componentState.Value == 1
				Component cmpo = AutoLoot_Filter_Components.GetAt(i) as Component

				If akItem.GetObjectComponentCount(cmpo) > 0
					Return True
				EndIf
			EndIf
		EndIf

		i += 1
	EndWhile

	Return False
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
		objLoot.Activate(DummyActor, False)
	EndIf
EndFunction

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

; Actor
Actor Property PlayerRef Auto
Actor Property DummyActor Auto

; Formlists
Formlist Property Filter Auto
Formlist Property AutoLoot_Filter_Components Auto
Formlist Property AutoLoot_Globals_Components Auto
Formlist Property AutoLoot_Locations Auto

; Globals
GlobalVariable Property Destination Auto
GlobalVariable Property Delay Auto
GlobalVariable Property Radius Auto
GlobalVariable Property AutoLoot_Setting_AllowStealing Auto
GlobalVariable Property AutoLoot_Setting_StealingIsHostile Auto
GlobalVariable Property AutoLoot_Setting_LootOnlyOwned Auto
GlobalVariable Property AutoLoot_Setting_LootSettlements Auto

; Misc.
Int Property TimerID Auto

; Perk
Perk Property ActivePerk Auto
