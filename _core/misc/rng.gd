extends Node

const _Character = preload("res://_core/actors/characters/character.tscn")
var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	
	
func gen_char():
	var character = _Character.instance()
	return character
