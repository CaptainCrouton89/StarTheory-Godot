extends Node

var contents = {}
var _hotbar_key
var keys1 = ["Q", "W", "E", "A", "S", "D", "Z", "X", "C"]
var keys2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

func _ready():
	pass
	
	
func init(hotbarKey, type):
	self._hotbar_key = hotbarKey
	if type == "module":
		contents = {
			keys1[0]: null,
			keys1[1]: null,
			keys1[2]: null,
			keys1[3]: null,
			keys1[4]: null,
			keys1[5]: null,
			keys1[6]: null,
			keys1[7]: null,
			keys1[8]: null
			}
	elif type == "crewMember":
		contents = {
			keys2[0]: null,
			keys2[1]: null,
			keys2[2]: null,
			keys2[3]: null,
			keys2[4]: null,
			keys2[5]: null,
			keys2[6]: null,
			keys2[7]: null,
			keys2[8]: null
			}
	return self
	
	
func get_mod_keys():
	return self.keys1


func get_crew_keys():
	return self.keys2
	
	
func add(entity, key):
	self.contents[key] = entity


func remove(key):
	self.contents[key] = null


func get_entity_at(key):
	if key in self.contents.keys():
		return self.contents[key]
	else:
		return null
		

func is_full() -> bool:
	for item in self.contents.values():
		if not item:
			return false
	return true
	

func get_contents() -> Array:
	return self.contents
	
	
func get_hotbar_key() -> String:
	return self._hotbar_key
	
	
func get_empty_key() -> String:
	for key in self.contents.keys():
		if self.contents[key] == null:
			return key
	push_error("no empty key found")
	return ""
