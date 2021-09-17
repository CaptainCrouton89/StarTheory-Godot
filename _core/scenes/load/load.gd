extends "res://_core/scenes/baseScene.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("loading resources")
	Db.load_data()
	Db.load_sound()
	Db.load_textures()
	Game.galaxy.init()
	Game.player.init()
	Game.scene_manager.switch_game_scenes("start")
	# play music


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
