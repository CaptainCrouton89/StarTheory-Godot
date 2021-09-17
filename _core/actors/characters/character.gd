extends Node

const _Stats = preload("res://_core/actors/characters/characterStats.tscn")
const _CombatManager = preload("res://_core/actors/characters/combatManager.tscn")

onready var inventory = $inventory

var stats = _Stats.instance()
var combat_manager = _CombatManager.instance()

# 
var ai_profile = {
	
}


# Called when the node enters the scene tree for the first time.
func _ready():
	self.inventory.init(self)
	self.combat_manager.init(self)
	
	
func get_ship():
	return self.inventory.get_ships()[0]

	
func test_loadout():
	for item in self.inventory.get_test_items():
		self.add(item)
	return self

func random_init():
	pass
	
func add(item):
	self.inventory.add(item)
	
func move_to(location):
	self._Stats.set_location(location)
