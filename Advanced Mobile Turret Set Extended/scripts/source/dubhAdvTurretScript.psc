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
			; Dismantle
			If button == 0
				If Self.Is3DLoaded() && !Self.IsDisabled()
					Self.Disable(False)
					Player.AddItem(dubhAdvTurretItem, 1, False)
				EndIf
			; Rig
			ElseIf button == 1
				If Self.Is3DLoaded() && !Self.IsDisabled()
					Utility.Wait(3.0) ; wait 3 seconds
					If !Self.IsDead()
						Self.SetEssential(False)
						Self.DamageObject(9999)
					EndIf
				EndIf
			; Scrap
			ElseIf button == 2
				If Self.Is3DLoaded() && !Self.IsDisabled()
					Self.Disable(False)
					RewardScrap(dubhAdvTurretScrap, Player)
				EndIf
			Else
				; do nothing
			EndIf
		EndIf
	EndIf
EndFunction

Function OnDeath(Actor akKiller)
	Self.RemoveAllItems(None, False) ; make sure player can't loot turret
	Self.BlockActivation(True, False)
	Self.Disable(True) ; disable because actor continues to play a sound
EndFunction

Function OnKill(Actor akVictim)
	Int iXPRewardKillOpponent = Game.GetGameSettingInt("iXPRewardKillOpponent")
	Game.RewardPlayerXP(iXPRewardKillOpponent, False)
	Self.DamageObject(10) ; max: 3 kills per turret
EndFunction