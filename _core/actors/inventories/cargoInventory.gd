extends Node

var contents = []

func _ready():
	pass

func add(cargo):
	contents.append(cargo)

func get_contents() -> Array:
	return self.contents
