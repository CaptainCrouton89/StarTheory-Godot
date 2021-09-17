extends "res://_core/scenes/baseScene.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_fullscreen = true
	_ui = $startUi

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
