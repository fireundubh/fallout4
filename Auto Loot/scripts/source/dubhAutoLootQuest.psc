ScriptName dubhAutoLootQuest Extends Quest

Perk Property dubhAutoLootPerk Auto

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: dubhAutoLootQuest> " + msgTrace, 0)
EndFunction

Event OnQuestInit()
	Log("Adding perk...")
	Game.GetPlayer().AddPerk(dubhAutoLootPerk, False)
EndEvent

Event OnQuestShutdown()
	Log("Removing perk...")
	Game.GetPlayer().RemovePerk(dubhAutoLootPerk)
EndEvent