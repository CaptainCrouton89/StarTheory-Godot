extends Node

const _Weapon = preload("res://_core/actors/shipItems/modules/weapon.tscn")
const _Engine = preload("res://_core/actors/shipItems/modules/engine.tscn")
const _Gyroscope = preload("res://_core/actors/shipItems/modules/gyroscope.tscn")
const _Repair = preload("res://_core/actors/shipItems/modules/repair.tscn")
const _Module = preload("res://_core/actors/shipItems/modules/module.tscn")
const _Cargo = preload("res://_core/actors/shipItems/cargo/cargo.tscn")
const _Ship = preload("res://_core/actors/shipItems/ships/ship.tscn")
const _Crew = preload("res://_core/actors/shipItems/crewMembers/crewMember.tscn")

var _db
var _sb = {}
var _tb = {}

func _ready():
	pass
	#print(cache)	
	
func load_data() -> void:
	var f = File.new()
	f.open("res://data/data.json", File.READ)
	_db = JSON.parse(f.get_as_text()).result
	f.close()
	
	
func load_textures() -> void:
	var regex = RegEx.new()
	regex.compile("\\w+.png")
	var texture_files = _get_dir_contents("res://assets/graphics")
	for file in texture_files:
		var matches = regex.search(file)
		if matches:
			var string = matches.get_string()
			if !(".import" in file):
				var name = string.replace(".png", "")
				_tb[name] = load(file)
				print(name, ": ", file)
	

func load_sound() -> void:
	var regex = RegEx.new()
	regex.compile("\\w+.wav")
	var sound_files = _get_dir_contents("res://assets/audio")
	for file in sound_files:
		var matches = regex.search(file)
		if matches:
			var string = matches.get_string()
			if !(".import" in file):
				var name = string.replace(".wav", "")
				_sb[name] = load(file)
				#print(name, ": ", file)
	
	
func get_sound(name):
	return _sb.get(name)
	
	
func get_texture_at(name):
	return _tb.get(name, _tb["null_texture"])
	
	
func get_item(name : String, type : String) -> Node:
	var config
	var item
	if type in _db.keys():
		config = _db[type][name]
	else:
		config = _db["module"][type][name]
	assert(config, str("Config with name ", name, " and type ", type, "could not be found"))
	match type:
		"module":
			item = _Module.instance()
		"weapon":
			item = _Weapon.instance()
		"engine":
			item = _Engine.instance()
		"gyroscope":
			item = _Gyroscope.instance()
		"repair":
			item = _Repair.instance()
		"crewMember":
			item = _Crew.instance()
		"cargo":
			item = _Cargo.instance()
		"ship":
			item = _Ship.instance()
		var unknown:
			push_error(str("Cannot instance config with type ", type))
	config["name"] = name
	item.init(config)
	return item
	
	
func _get_dir_contents(path : String) -> Array:
	var contents = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true, true)
		var file_name = dir.get_next()
		while file_name != "":
			var file_path = path + "/" + file_name
			if dir.current_is_dir():
				contents += _get_dir_contents(file_path)
			else:
				contents.append(file_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path at ", path)
	return contents
	
	

