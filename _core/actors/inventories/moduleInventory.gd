extends Node

var contents = []

func _ready():
	pass

func add(module):
	contents.append(module)
	
func reset_modules() -> void:
	for module in self.contents:
		module.reset()

func get_contents() -> Array:
	return self.contents
