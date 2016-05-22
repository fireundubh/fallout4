ScriptName DefaultDisableHavokOnLoad Extends ObjectReference Default
{Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab()}

Group Optional_Properties
	Bool Property HavokOnHit Auto Const
	{Start Havok Sim when hit? DEFAULT: FALSE}
	Bool Property HavokOnActivate Auto Const
	{Start Havok Sim when activated? DEFAULT: FALSE}
	Bool Property HavokOnZKey Auto Const
	{Start Havok Sim when grabbed by player? DEFAULT: FALSE}
	Keyword Property LinkHavokPartner Auto Const
	{Link with this keyword and that ref will also sim with myself}
	Bool Property BeenSimmed Auto Hidden
	{Prevent an object that has been havok'd in-game from going static}
EndGroup

Bool bHasChangedContainers

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	bHasChangedContainers = True
	BeenSimmed = True
EndEvent

Event OnLoad()
	If (BeenSimmed == False && Self.Is3DLoaded())
		SetMotionType(Motion_Keyframed, True)

		If !bHasChangedContainers
			Self.MoveToMyEditorLocation()
		EndIf

		If HavokOnHit
			RegisterForHitEvent(Self)
		EndIf
	EndIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnActivate(ObjectReference triggerRef)
	If HavokOnActivate == True && BeenSimmed == False
		ReleaseToHavok()
	EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference var1, Form var2, Projectile var3, Bool var4, Bool var5, Bool var6, Bool var7, String asMaterialName)
	If HavokOnHit == True && BeenSimmed == False
		ReleaseToHavok()
	EndIf
EndEvent

Event OnGrab()
	If HavokOnZkey == True && BeenSimmed == False
		ReleaseToHavok()
	EndIf
EndEvent

Function ReleaseToHavok()
		BeenSimmed = True

		ObjectReference myLink = GetLinkedRef(LinkHavokPartner)
		If myLink != None
			DefaultDisableHavokOnLoad linkScript = myLink as DefaultDisableHavokOnLoad

			If (linkScript) && (linkScript.BeenSimmed == False)
				linkScript.ReleaseToHavok()
			EndIf
		EndIf

		If Self.WaitFor3DLoad()
			SetMotionType(Motion_Dynamic, True)
			Self.ApplyHavokImpulse(0, 0, 1, 5)
		EndIf
EndFunction
