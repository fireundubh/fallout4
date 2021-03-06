ScriptName AutoLoot:dubhAutoLootDummyScript Extends Actor

; -----------------------------------------------------------------------------
; EVENTS
; -----------------------------------------------------------------------------

Event OnInit()
	AddInventoryEventFilter(None)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If PlayerOnly.Value == 1
		Self.RemoveItem(akBaseItem, aiItemCount, Notifications.Value as Bool, PlayerRef)
	Else
		WorkshopScript kWorkshop = AutoLoot_Settlements.GetAt(Destination.Value as Int) as WorkshopScript
		Self.RemoveItem(akBaseItem, aiItemCount, Notifications.Value as Bool, kWorkshop as ObjectReference)
	EndIf
EndEvent

; -----------------------------------------------------------------------------
; PROPERTIES
; -----------------------------------------------------------------------------

Actor Property PlayerRef Auto

Formlist Property AutoLoot_Settlements Auto

GlobalVariable Property Destination Auto
GlobalVariable Property PlayerOnly Auto
GlobalVariable Property Notifications Auto
