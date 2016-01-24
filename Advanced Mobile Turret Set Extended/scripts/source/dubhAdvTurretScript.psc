ScriptName dubhAdvTurretScript Extends Actor

Weapon Property dubhTurretItem Auto
Message Property dubhTurretMessage Auto
Perk Property dubhTurretPerk Auto

Formlist Property dubhTurretScrap01 Auto ; common materials
Formlist Property dubhTurretScrap02 Auto ; screws, aluminum
Formlist Property dubhTurretScrap03 Auto ; circuitry, nuclear material, fiber optics

Perk Property HeavyGunner01 Auto
Perk Property HeavyGunner02 Auto
Perk Property HeavyGunner03 Auto
Perk Property HeavyGunner04 Auto
Perk Property HeavyGunner05 Auto

Perk Property Scrapper01 Auto
Perk Property Scrapper02 Auto

ActorValue Property Health Auto

Function RewardScrap(Formlist akFormlist, Actor akRecipient)
	Int i = 0
	While i < akFormlist.GetSize()
		Int rng = Utility.RandomInt(0, 9)
		If rng > 4
			Int rand = Utility.RandomInt(1, 3)
			akRecipient.AddItem(akFormlist.GetAt(i) as MiscObject, rand, False)
		EndIf
		i += 1
	EndWhile
EndFunction

Function OnLoad()
	Actor Player = Game.GetPlayer()

	; Heavy Gunner Perk Check
	If Player.HasPerk(HeavyGunner01) && !Self.HasPerk(HeavyGunner01)
		Self.AddPerk(HeavyGunner01, False)
	EndIf

	If Player.HasPerk(HeavyGunner02) && !Self.HasPerk(HeavyGunner02)
		Self.AddPerk(HeavyGunner02, False)
	EndIf

	If Player.HasPerk(HeavyGunner03) && !Self.HasPerk(HeavyGunner03)
		Self.AddPerk(HeavyGunner03, False)
	EndIf

	If Player.HasPerk(HeavyGunner04) && !Self.HasPerk(HeavyGunner04)
		Self.AddPerk(HeavyGunner04, False)
	EndIf

	If Player.HasPerk(HeavyGunner05) && !Self.HasPerk(HeavyGunner05)
		Self.AddPerk(HeavyGunner05, False)
	EndIf
EndFunction

Function OnActivate(ObjectReference akActionRef)
	Actor Player = Game.GetPlayer()
	If Player.HasPerk(dubhTurretPerk)
		If akActionRef == Player
			Int button = dubhTurretMessage.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			; Dismantle
			If button == 0
				If Self.Is3DLoaded() && !Self.IsDisabled()
					Self.Disable(False)
					Player.AddItem(dubhTurretItem, 1, False)
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

					; Common Scrap
					RewardScrap(dubhTurretScrap01, Player)

					; Uncommon Scrap
					If Player.HasPerk(Scrapper01)
						RewardScrap(dubhTurretScrap02, Player)
					EndIf

					; Rare Scrap
					If Player.HasPerk(Scrapper02)
						RewardScrap(dubhTurretScrap03, Player)
					EndIf
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
	Game.RewardPlayerXP(iXPRewardKillOpponent, False) ; gives player fixed kill xp reward when turret makes kills

	akVictim.CreateDetectionEvent(Self, 100) ; ensures that any nearby actors know there was a kill here

	Self.SetValue(Health, Self.GetValue(Health) - 5) ; reduces turret health by 5 for each kill; 30 health = 6 kills
EndFunction