ScriptName dubhAdvTurretScript Extends Actor

Weapon Property dubhAdvTurretItem Auto
Message Property dubhAdvTurretMessage Auto
Perk Property dubhAdvTurretPerk Auto
Formlist Property dubhAdvTurretScrap Auto

Function RewardScrap(Formlist akFormlist, Actor akRecipient)
	Int i = 0
	While i < akFormlist.GetSize()
		Int rng = Utility.RandomInt(0, 9)
		If rng > 4
			akRecipient.AddItem(akFormlist.GetAt(i) as MiscObject, 1, False)
		EndIf
		i += 1
	EndWhile
EndFunction

Function OnActivate(ObjectReference akActionRef)
	Actor Player = Game.GetPlayer()
	If Player.HasPerk(dubhAdvTurretPerk)
		If akActionRef == Player
			Int button = dubhAdvTurretMessage.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			If button == 0
				If Self.Is3DLoaded() && !Self.IsDisabled()
					Self.Disable(False)
					RewardScrap(dubhAdvTurretScrap, Player)
				EndIf
			ElseIf button == 1
				If Self.Is3DLoaded() && !Self.IsDisabled()
					Self.Disable(False)
					Player.AddItem(dubhAdvTurretItem, 1, False)
				EndIf
			ElseIf button == 2
				If Self.Is3DLoaded() && !Self.IsDisabled()
					Utility.Wait(5.0) ; wait 5 seconds
					If !Self.IsDead()
						Self.KillEssential(None)
						Self.RemoveAllItems(None, False)
						Self.Disable(True)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction