extends Node
class_name QuestManager

enum QuestID {
	KillSkel
}

var current_quest : Quest

var quest_types = {
	QuestID.KillSkel : Quest_KillSkel
}

func _init () -> void:
	self.current_quest = self.quest_types[QuestID.KillSkel].new()
	
