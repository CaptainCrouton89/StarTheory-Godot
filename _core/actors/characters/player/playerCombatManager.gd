extends "res://_core/actors/characters/combatManager.gd"

var sound_scape = {}
var camera
var max_damage_ever_received = 1000

func _ready():
	pass


func set_sound_scape(soundScape : Dictionary):
	for key in soundScape.keys():
		self.sound_scape[key] = soundScape[key]
		
		
func set_camera(cmr: Camera2D):
	self.camera = cmr
	
	
func play_sound(sound, db, dir, bus=Constants.bus["MASTER"]):
	var audio_stream = sound_scape[dir]
	audio_stream.stream = Db.get_sound(sound)
	audio_stream.volume_db = db
	audio_stream.bus = bus
	audio_stream.play()
	

func play_distant_sound(sound, db, dir):
	self.play_sound(
		sound, 
		Constants.decibels.FAINT, 
		Constants.sound.CENTER, 
		Constants.bus["DISTANT"])
	
	
func receive_damage(damage, weapon):
	.receive_damage(damage, weapon)
	if damage > max_damage_ever_received:
		max_damage_ever_received = damage
	
	camera.add_trauma(max_damage_ever_received/damage)
	#play_sound(1, 2, 2)
