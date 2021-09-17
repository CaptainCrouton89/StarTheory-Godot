extends "res://_core/scenes/baseScene.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_fullscreen = true
	Game.scene_manager.switch_game_scenes("load")
