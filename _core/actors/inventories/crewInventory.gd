extends Node

var contents = []

func _ready():
	pass

func add(crewMember):
	contents.append(crewMember)

func get_contents() -> Array:
	return self.contents
