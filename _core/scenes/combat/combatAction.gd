extends Node


var time_investment
var delay

var module
var crew_member
var target

var using = false
var launched = false
var effected = false
var _finished = false

var time
var time_till_launch
var time_till_effect

func _ready():
	pass

func init(module, crewMember, target):
	self.module = module
	self.crew_member = crewMember
		
	self.target = target
	self.time = 0
	self.time_till_launch = self.module.time_investment * self.crew_member.speed
	
	self.module.use(self.time_till_launch) # Will tick down until usable again
	self.crew_member.use(self.time_till_launch) 
	
	self.use()
	
	
func is_finished():
	return _finished
	
	
func use():
	self.module.use(self.time_till_launch)
	self.crew_member.use(self.time_till_launch)
	self.using = true

	
func launch():
	print("Launching ", self.module.display_name)
	self.time_till_effect = self.module.effect_delay
	if not self.module.launch(self.time_till_effect):
		return false
	if not self.crew_member.launch(self.time_till_effect):
		return false
	self.launched = true
	self.using = false
	return true
	
	
func effect():
	print("Effect ", self.module.display_name)
	self.module.effect(self.crew_member, self.target)
	self.effected = true
	
	
func tick_forward(delta):
	self.time += delta

	# keep track of event up until the event occurs (post delay), and let the 
	# module itself keep track of its cooldown. 
	if self.using:
		if self.time >= self.time_till_launch:
			if not self.launch():
				abort()
			self.time = 0
	if self.launched:
		if self.time >= self.time_till_effect:
			if not self.effected:
				self.effect()
		if self.time >= self.module.cooldown:
			self.module.cool_down()
			self._finished = true
			
			
func abort():
	self.using = false
	self._finished = true
	self.module.release()
	self.crew_member.release()
		
	
