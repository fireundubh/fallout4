ScriptName AutoLoot:dubhAutoLootEffectScrapScript Extends ActiveMagicEffect

; -----------------------------------------------------------------------------
; VARIABLES
; -----------------------------------------------------------------------------

Bool bWorkshopMode = False

ObjectReference[] LootArray = None

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnPlayerLoadGame()
	Actor Player = Game.GetPlayer()
	OnEffectFinish(Player, Player)
EndEvent

Event OnWorkshopMode(Bool aStart)
	bWorkshopMode = aStart
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	StartTimer(dubhAutoLootDelay.GetValueInt(), dubhAutoLootTimer)
EndEvent

Event OnTimer(Int aiTimerID)
	If bWorkshopMode

		; get player
		Actor Player = Game.GetPlayer()

		; do not run if the player no longer has the perk
		If Player.HasPerk(dubhAutoLootPerk)

			; do not run if the location cannot be auto looted
			If CanAutoLootLocation()


			EndIf

			StartTimer(dubhAutoLootDelay.GetValueInt(), dubhAutoLootTimer)
		EndIf

	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; clear LootArray one final time to prevent possible memory leak
	; reason: LootArray might remain filled if effect ends mid-cycle
	LootArray.Clear()
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
GlobalVariable Property dubhAutoLootTheftAllowed Auto
GlobalVariable Property dubhAutoLootTheftAlarm Auto
GlobalVariable Property dubhAutoLootTheftOnlyOwned Auto
GlobalVariable Property dubhAutoLootWorkshopLooting Auto

; Formlists
Formlist Property dubhAutoLootFilter Auto
Formlist Property dubhAutoLootLocations Auto
Formlist Property dubhAutoLootSettlements Auto

; Perk
Perk Property dubhAutoLootPerk Auto

; Actor
Actor Property dubhAutoLootDummyActor Auto

; -----------------------------------------------------------------------------
; FUNCTIONS
; -----------------------------------------------------------------------------

; Filter Loot Array
ObjectReference[] Function FilterLootArray(ObjectReference[] akArray)
	ObjectReference[] kResult = new ObjectReference[akArray.Length]

	Int i = 0
	While i < akArray.Length
		ObjectReference kItem = akArray[i]
		ObjectReference kContainer = kItem.GetContainer()

		If (kContainer == None) && (kContainer != Game.GetPlayer())
			If !kItem.IsDestroyed() ; for flora
				If dubhAutoLootTheftOnlyOwned.GetValue() == False
						kResult.Add(kItem, 1)
				Else
					If Game.GetPlayer().WouldBeStealing(kItem) == True
						kResult.Add(kItem, 1)
					EndIf
				EndIf
			EndIf
		EndIf

		i += 1
	EndWhile

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
	; get player
	Actor Player = Game.GetPlayer()

	; do not run if the player no longer has the perk
	If Player.HasPerk(dubhAutoLootPerk)
		Bool bPlayerOnly = dubhAutoLootPlayerOnly.GetValue() as Bool
		Int iContainer = dubhAutoLootContainer.GetValueInt() as Int

		; determine where to send loot
		ObjectReference kContainer = None
		If (iContainer == 0) || (bPlayerOnly == True)
			kContainer = Player
		Else
			kContainer = (dubhAutoLootSettlements.GetAt(iContainer) as WorkshopScript) as ObjectReference
		EndIf

		; handle non-player object as container
		; force dubhAutoLootDummyActor to activate the objLoot reference
		If kContainer != Player
			If objLoot.Activate(dubhAutoLootDummyActor, True)
				dubhAutoLootDummyActor.RemoveAllItems(kContainer, False)
				Return True
			EndIf
			Return False
		EndIf

		; handle player object as container
		If objLoot.Activate(Player, False)
			Return True
		EndIf
	EndIf

	Return False
EndFunction
