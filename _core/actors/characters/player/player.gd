extends Node

const _Stats = preload("res://_core/actors/characters/characterStats.tscn")
const _CombatManager = preload("res://_core/actors/characters/player/playerCombatManager.tscn")

onready var inventory = $inventory
var stats = _Stats.instance()
var combat_manager = _CombatManager.instance()

const Hotbar = preload("res://_core/actors/inventories/hotbar.tscn")
const _Character = preload("res://_core/actors/characters/character.tscn")

var module_hotbars = {
					"F": Hotbar.instance().init("F", "module"), 
					"R": Hotbar.instance().init("R", "module"),
					"V": Hotbar.instance().init("V", "module"),
					}
					
var crewMember_hotbars = {
					"T": Hotbar.instance().init("T", "crewMember"), # [ present twice on this line
					"G": Hotbar.instance().init("G", "crewMember"),
					}
					


func _ready():
	Game.player = self
		
	
func test():
	for item in self.inventory.get_test_items():
		self.add(item)
	
func init():
	self.inventory.init(self)
	self.combat_manager.init(self)
	self.test()
	self.inventory.print_inventory()
	
	
func add(itm, hotbar : String="", key : String=""):
	var item = self.inventory.add(itm)
	if not hotbar:
		var hb = self._gen_hotbar(item)
		if hb:
			hotbar = hb.get_hotbar_key()
			key = hb.get_empty_key()
	if item.is_type("TYPE_MODULE"):
		self.module_hotbars[hotbar].add(item, key)
	elif item.is_type("TYPE_CREWMEMBER"):
		self.crewMember_hotbars[hotbar].add(item, key)


func _gen_hotbar(item) -> Node:
	var hotbars
	if item.is_type("TYPE_MODULE"):
		hotbars = module_hotbars
	elif item.is_type("TYPE_CREWMEMBER"):
		hotbars = crewMember_hotbars
	else:
		#print(item.display_name, " doesn't belong in hotbar")
		# If the config isn't for an item on hotbar, it doesn't need anything
		return null
	for hotbar in hotbars.values():
		if not hotbar.is_full():
			return hotbar
	push_error("no empty hotbar found")
	return null
		
	
func get_item_with_key(hotbar : String, key : String):
	print("hotbar: ", hotbar, ", key: ", key)
	if hotbar in module_hotbars.keys():
		return self.module_hotbars[hotbar].get_entity_at(key)
	elif hotbar in crewMember_hotbars.keys():
		return self.crewMember_hotbars[hotbar].get_entity_at(key)
	else:
		push_error("Hotbar key could not be found")


func get_mod_hotbar_keys():
	return module_hotbars[module_hotbars.keys()[0]].contents.keys()
	

func get_crew_hotbar_keys():
	return crewMember_hotbars[crewMember_hotbars.keys()[0]].contents.keys()


func get_ship():
	return self.inventory.get_ships()[0]
