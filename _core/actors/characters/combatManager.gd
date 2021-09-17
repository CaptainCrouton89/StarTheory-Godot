extends Node

# Component class of characters to enable combat. 

var character
var _orientation = Constants.orientation.BROADSIDE
var ship

func get_orientation() -> int:
	return _orientation
	
	
func set_orientation(orientation : int):
	self._orientation = orientation


func init(character : Node):
	self.character = character
	
	
func initiate_combat():
	self.ship = self.character.get_ship()


func receive_damage(damage, weapon):
	print(self.character.name)
	self.character.get_ship().take_damage(damage, weapon)
	
	
func play_sound(sound, db, dir, bus=null):
	Game.player.combat_manager.play_distant_sound(sound, db, dir)
