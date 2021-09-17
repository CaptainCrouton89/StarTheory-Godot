extends "res://_core/scenes/baseScene.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const _CombatAction = preload("res://_core/scenes/combat/combatAction.tscn")

var module_hotbar_keys
var module_hotkeys
var crewMember_hotbar_keys
var crewMember_hotkeys
var call_command_key = "Space"

var ally_characters = []
var enemy_characters = []

var current_target
var selected_module
var selected_crewMember
var current_module_hotbar
var current_crewMember_hotbar

var action_queue = []

onready var enemy_ai = $EnemyAI
onready var module_bar = $UI/UI/modulesSelectionMenu/MarginContainer/ModuleBar.get_children()
onready var sound_scape = {
	Constants.sound.RIGHT: $RightAudio,
	Constants.sound.LEFT: $LeftAudio,
	Constants.sound.CENTER: $CenterAudio,
	Constants.sound.ABOVE: $AboveAudio,
	Constants.sound.BELOW: $BelowAudio
}

func test_enemy():
	var enemy = RNG.gen_char()
	add_child(enemy) # Otherwise doesn't call _ready()
	enemy.test_loadout()
	return enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	self.initialize_combat()
#	for button in buttons:
#		print("button name:", button.name)
		
		
func initialize_hotkeys():
	self.module_hotkeys = Game.player.get_mod_hotbar_keys()
	self.crewMember_hotkeys = Game.player.get_crew_hotbar_keys()
	
	self.module_hotbar_keys = Game.player.module_hotbars.keys()
	self.crewMember_hotbar_keys = Game.player.crewMember_hotbars.keys()
	
	self.current_module_hotbar = self.module_hotbar_keys[0]
	self.current_crewMember_hotbar = self.crewMember_hotbar_keys[0]
	
	print("Hotkeys: ", self.module_hotkeys, self.crewMember_hotkeys)
	print("Hotbars: ", self.module_hotbar_keys, self.crewMember_hotbar_keys)
	
	
func update_module_bar():
	var modules = Game.player.module_hotbars[current_module_hotbar].get_contents()
	var i = 0
	for key in Game.player.module_hotbars[current_module_hotbar].get_mod_keys():
		module_bar[i].set_module(modules[key])
		i += 1
	
	
func initialize_combat():
	self.ally_characters.append(Game.player)
	self.enemy_characters.append(self.test_enemy())
	
	for ally in ally_characters:
		ally.combat_manager.initiate_combat()
	for enemy in enemy_characters:
		enemy.combat_manager.initiate_combat()
	
	self.current_target = self.enemy_characters[0]
	
	Game.player.combat_manager.set_camera($camera)
	Game.player.combat_manager.set_sound_scape(sound_scape)
	
	initialize_hotkeys()
	update_module_bar()
	

func _process(delta):	
	# Ticks forward all the orders being performed, and removes them once they
	# are carried out.
	for action_index in self.action_queue.size():
		self.action_queue[action_index].tick_forward(delta)
	for action in self.action_queue:
		if action.is_finished():
			self.action_queue.erase(action)

		
func _input(event):
	if event is InputEventKey and event.pressed:
		var key = event.as_text()
		# '[' is interpreted as BraceLeft, probably should make key codes 
		# rather than as_text()
		
		if key == self.call_command_key:
			if check_usable(self.selected_module, self.selected_crewMember, self.current_target):
				print("calling command")
				self.queue_action(self.selected_module, self.selected_crewMember, self.current_target)

		if key in self.module_hotkeys:
			var mod = Game.player.get_item_with_key(current_module_hotbar, key)
			if mod:
				selected_module = mod
				print("module: ", self.selected_module.display_name)
		if key in self.crewMember_hotkeys:
			var crew = Game.player.get_item_with_key(current_crewMember_hotbar, key)
			if crew:
				selected_crewMember = crew
				print("crew: ", self.selected_crewMember.display_name)
			
		if key in self.module_hotbar_keys:
			self.current_module_hotbar = key
			update_module_bar()
			print("Module hotbar: ", key)
		if key in self.crewMember_hotbar_keys:
			self.current_crewMember_hotbar = key
			update_module_bar()
			print("Crew hotbar: ", key)
			
func check_usable(module, crewMember, target):
	var callable = true
	if not module:
		return
	if not crewMember:
		return
	if module.is_in_use():
		#print("Module is being used right now")
		callable = false
	if module.is_cooling_down():
		#print("Module is still on cooldown")
		callable = false
	if crewMember.is_in_use():
		#print("Crew member is being used right now")
		callable = false
	return callable
	
			
func queue_action(module, crewMember, target):
	print("action queued")
	var combat_action = _CombatAction.instance()
	combat_action.init(module, crewMember, target)
	self.action_queue.append(combat_action)


func init_hotbar() -> void:
	# cycle through buttons and set image on each one to the proper module, 
	# update the name, and change the hotkey connection
	pass
