extends "res://_core/actors/shipItems/modules/module.gd"

# Constant Stats
var mounting
var damage_type
var damage
var reach

var target # Must be a character 

func is_type(t):
	return t == "TYPE_WEAPON" or .is_type(t)
func get_type():
	return "TYPE_WEAPON"

func _ready():
	pass

func init(config):
	.init(config)
	var m = config["mounting"]
	if m == "broadside":
		self.mounting = Constants.orientation.BROADSIDE
	elif m == "turret":
		self.mounting = Constants.orientation.FORWARD
	self.mounting = config["mounting"]
	self.damage_type = config["damage_type"]
	self.damage = config["damage"]
	self.reach = config["reach"]
	return self
	

func launch(time):
	.launch(time)
	var orientation = self.character.combat_manager.get_orientation()
	if orientation == Constants.orientation.AFT:
		return false
	if (orientation == Constants.orientation.FORWARD 
			&& self.mounting == Constants.orientation.BROADSIDE):
		return false
	return true


func effect(crewMember, target):
	.effect(crewMember, target)
	var damage = self.damage * crewMember.potency
	target.combat_manager.receive_damage(damage, self)
		
