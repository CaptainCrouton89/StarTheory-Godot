extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _ui
var is_current_scene = false

# Called when the node enters the scene tree for the first time.
func _ready():
	is_current_scene = true
	pass #load ui
	

func get_ui():
	return _ui




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
