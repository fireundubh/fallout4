ScriptName dubhAutoLootQuest Extends Quest

Form Property dubhAutoLootBook Auto

Function Log(String msgTrace)
	Debug.Trace("Auto Loot: dubhAutoLootQuest> " + msgTrace, 0)
EndFunction

Event OnQuestInit()
	Game.GetPlayer().AddItem(dubhAutoLootBook, 1, False)
EndEvent

Event OnQuestShutdown()
	Game.GetPlayer().RemoveItem(dubhAutoLootBook, 1, False, None)
EndEvent