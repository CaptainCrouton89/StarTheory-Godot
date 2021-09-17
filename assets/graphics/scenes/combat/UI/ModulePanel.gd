extends Control

var module
var scaling_factor = 100

onready var module_name = $MarginContainer/VBoxContainer/Contents/Text/Name
onready var module_icon = $MarginContainer/VBoxContainer/Contents/ModuleIcon
onready var warmup = $Warmup
onready var cooldown = $Cooldown
onready var success = $Success
onready var broken = $Broken
onready var damage = $Damage

func _ready():
	pass
	
	
func set_display(delta):
	if warmup.visible:
		warmup.value += delta * scaling_factor
	if cooldown.visible:
		cooldown.value -= delta * scaling_factor
		

func use():
	warmup.visible = true
	warmup.max_value = self.module.time * scaling_factor
	warmup.value = 0
	
	
func launch():
	warmup.visible = false
	cooldown.visible = true
	cooldown.max_value = self.module.time * scaling_factor
	cooldown.value = cooldown.max_value
	
func cool_down():
	cooldown.visible = false
	
	
func take_damage():
	pass
	

func effect():
	success.visible = true
	yield(get_tree().create_timer(0.1),"timeout")
	success.visible = false
	yield(get_tree().create_timer(0.1),"timeout")
	success.visible = true
	yield(get_tree().create_timer(0.1),"timeout")
	success.visible = false


func set_module(module):
	if self.module:
		self.module.remove_panel()
	self.module = module
	if self.module:
		self.module.set_panel(self)
		self.module_name.text = self.module.display_name
		var tex = Db.get_texture_at(self.module.texture)
		print(tex)
		self.module_icon.texture = tex
	

func _process(delta):
	if self.module: 
		visible = true
		self.set_display(delta)
	else:
		visible = false
