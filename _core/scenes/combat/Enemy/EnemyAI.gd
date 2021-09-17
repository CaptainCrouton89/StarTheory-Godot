extends Node


onready var combat = get_parent()
onready var enemies = combat.enemy_characters

var ai_profile


func _ready():
	pass


func _process(_delta):
	for enemy in self.enemies:
		take_action(enemy)


func take_action(character):
	# choose random module and crew, try to queue the action??
	var module = intelli_select_module(character)
	var crewMember = intelli_select_crewMember(character)
	
	if combat.check_usable(module, crewMember, Game.player):
		print("enemy firing command")
		combat.queue_action(module, crewMember, Game.player)


func intelli_select_module(character) -> Node:
	var ai_profile = character.ai_profile
	var modules = character.inventory.get_modules()
	return modules[1] # 5 is laser, 6 is demo, 1-5 is kinetic
	return modules[RNG.rng.randi_range(0, modules.size() - 1)]
	
	# Check for incoming strikes. If yes, check if it can block it, do so
	# Check if health is low, then repair whatever pool is lowest
	# 
	
func intelli_select_crewMember(character) -> Node:
	var ai_profile = character.ai_profile
	var crew = character.inventory.get_crew()
	return crew[0]
