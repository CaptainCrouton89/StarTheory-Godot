extends "res://_core/actors/shipItems/shipItem.gd"

var time_investment
var cooldown
var effect_delay
var skills

var use_sound
var launch_sound
var effect_sound

var _in_use = false
var _cooling_down = false
var _effect = false

var panel
var time

func is_type(t):
	return t == "TYPE_MODULE" or .is_type(t)
func get_type():
	return "TYPE_MODULE"

func _ready():
	pass

func init(config):
	.init(config)
	self.time_investment = config["time_investment"]
	self.cooldown = config["cooldown"]
	self.effect_delay = config["delay"]
	self.skills = config["skills"]
	if "use_sound" in keys:
		use_sound = config["use_sound"]
	if "launch_sound" in self.keys:
		launch_sound = config["launch_sound"]
	if "effect_sound" in self.keys:
		effect_sound = config["effect_sound"]
	
	self._set_combat_stats([time_investment, cooldown, effect_delay])
	

func set_panel(panel):
	self.panel = panel	
	
	
func remove_panel():
	self.panel = null

	
func is_in_use():
	return self._in_use
	

func is_cooling_down():
	return self._cooling_down
	
	
func use(time) -> bool:
	self.time = time
	self._in_use = true
	if self.panel:
		self.panel.use()
	return true
	
	
func launch(time):
	self.time = self.cooldown
	self._in_use = false
	self._cooling_down = true
	if self.panel:
		self.panel.launch()
	if self.launch_sound:
		self.character.combat_manager.play_sound(
			self.launch_sound, 
			Constants.decibels.NORMAL,
			Constants.sound.ABOVE)
	return true
	
	
func cool_down():
	print(self.display_name, " cooled down")
	self._cooling_down = false
	if self.panel:
		self.panel.cool_down()
	
	
func release() -> bool:
	self._in_use = false
	if self.panel:
		self.panel.release()
	return true
	

func effect(crew_member, target):
	print(
		crew_member.display_name, 
		" successfuly performed the action ", 
		self.display_name, 
		" on ", target.name)
	self._effect = true
	if self.panel:
		self.panel.effect()
	if self.effect_sound:
		target.combat_manager.play_sound(
			self.effect_sound, 
			Constants.decibels.NORMAL,
			Constants.sound.RIGHT)
		


#
#func get_used(useTime):
#	self.countdown = useTime
#	self.ready = false
#
#func cancel_use():
#	pass
#
#func tick_forward(delta):
#	if self.countdown > 0:
#		self.countdown -= delta
#		if self.countdown <= 0:
#			self.ready = true
#			self.action_initiated()
#
#func action_initiated():
#	self.actions_queue.append(self.delay)
#	print(self.display_name, " action initiated")
#
#func action_occurs():
#	print(self.display_name, " doing its action")
