extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player
onready var scene_manager
onready var galaxy


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func load_save() -> Dictionary:
	var f := File.new()
	f.open("res://saves/save1.json", File.READ)
	var result = JSON.parse(f.get_as_text()).result
	f.close()
		
	if result.error:
		printerr("Failed to parse save file: ", f.error_string)
	return result.result as Dictionary
	
func save(data: Dictionary):
	var f := File.new()
	f.open("res://saves/save1.json", File.WRITE)
	prints("Saving to", f.get_path_absolute())
	f.store_string(JSON.print(data))
	f.close()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var settingsConfig = {
	}
