extends Node

var config
var display_name
var description
var character
var texture
var keys
var stat_dict = {"combat": [], "shop": []}

# Do NOT instantiate this. Instantiate the children classes.

# Can be cargo, modules, crew, or the ship itself. These are glorified dictionary items

func is_type(type):
	return type == "TYPE_SHIPITEM"
func get_type():
	return "TYPE_SHIPITEM"

func set_owner(c):
	self.character = c

func _ready():
	pass

func init(cfg):
	config = cfg
	self.keys = config.keys()
	self.display_name = config["name"]
	self.description = config["description"]
	if "texture" in self.keys:
		self.texture = config["texture"]
	else:
		self.texture = "null_texture"
	
func _set_combat_stats(statArray : Array):
	for stat in statArray:
		stat_dict["combat"].append(stat)
	
#func _set_shop_stats(statArray : Array):
#	for stat in statArray:
#		stat_dict["shop"].append(stat)
