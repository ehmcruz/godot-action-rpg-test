extends Quest
class_name Quest_KillSkel

var boss_scene = preload("res://scenes/enemy.tscn")
var boss : Enemy = null

func _init () -> void:
	self.id = QuestManager.QuestID.KillSkel
	self.level_of_map[GameManager.MapID.Forest] = GameManager.LevelID.Forest_00
	self.level_of_map[GameManager.MapID.City] = GameManager.LevelID.City_00
	self.boss = self.boss_scene.instantiate()
	print("quest ", self.id, " created")

func on_level_loaded (level_: Level) -> void:
	var level = level_ as Level_City_00
	if level:
		self.boss.position = level.get_node("marker_boss_skel").position
		level.add_child(self.boss)

func on_enemy_destroyed (enemy: Enemy) -> void:
	if enemy == self.boss:
		quest_manager.on_quest_finish()
