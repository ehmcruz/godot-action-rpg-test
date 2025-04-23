extends Node
class_name QuestManager

enum QuestID {
	KillSkel,
	Foo
}

var current_quest : Quest

var quest_types = {
	QuestID.KillSkel : Quest_KillSkel,
	QuestID.Foo : Quest_Foo,
}

func _init () -> void:
	self.current_quest = self.quest_types[QuestID.KillSkel].new()
	
func on_quest_finish () -> void:
	var next_quest_id : QuestID = self.current_quest.id + 1
	self.current_quest = self.quest_types[next_quest_id].new()
	game_manager.on_quest_finish()
