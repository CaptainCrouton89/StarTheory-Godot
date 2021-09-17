extends "res://_core/actors/shipItems/shipItem.gd"

var _name

var _base_space
var _space

var _hitpoints
var _base_hitpoints

var _hull_armor
var _base_hull_armor

var _energy_shields
var _base_energy_shields

func is_type(type):
	return type == "TYPE_SHIP" or .is_type(type)
func get_type():
	return "TYPE_SHIP"


func _ready():
	pass
	

func take_damage(dmg, weapon):
	var hull_armor = self.get_percentage("hull")
	var shield_armor = self.get_percentage("shield")
	
	var prepend = ""
	print(weapon.mounting)
	print(weapon.damage)
	var damage_dict
	match weapon.damage_type:
		"demolition":
			damage_dict = Constants.demo_damage
		"kinetic":
			damage_dict = Constants.kinetic_damage
		"energy":
			damage_dict = Constants.energy_damage
			
	var post_shield_dmg = dmg - dmg * damage_dict["SHIELD_REDUCTION"] * get_percentage("shield")
	var shield_dmg = dmg * damage_dict["SHIELD_DAMAGE"]
	
	var post_hull_dmg = post_shield_dmg - post_shield_dmg * damage_dict["HULL_REDUCTION"] * get_percentage("hull")
	var hull_dmg = post_hull_dmg * damage_dict["HULL_DAMAGE"]
	
	print("Hull damage: ", hull_dmg, " Shield dmg: ", shield_dmg)
	
	self._hull_armor -= hull_dmg
	self._energy_shields -= shield_dmg
	self._hitpoints -= post_hull_dmg
	print("HP: ", self._hitpoints)
	

func get_percentage(armorType):
	if armorType == "hull":
		return self._hull_armor / self._base_hull_armor
	elif armorType == "shield":
		return self._energy_shields / self._base_energy_shields
	
	
func shield_take_damage(damage, weapon):
	pass	
	
	
func hull_take_damage(damage, weapon):
	pass	
	
	
func init(config):
	.init(config)
	self._base_space = config["space"]
	self._base_hitpoints = config["health"]
	self._base_hull_armor = config["hull_armor"]
	self._base_energy_shields = config["energy_shields"]
	self.reset()
	return self


func reset():
	self._hitpoints = self._base_hitpoints
	self._hull_armor = self._base_hull_armor
	self._energy_shields = self._base_energy_shields
