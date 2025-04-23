extends Quest
class_name Quest_Foo

func _init () -> void:
	self.id = QuestManager.QuestID.Foo
	self.level_of_map[GameManager.MapID.Forest] = GameManager.LevelID.Forest_00
	self.level_of_map[GameManager.MapID.City] = GameManager.LevelID.City_00
	print("quest ", self.id, " created")
