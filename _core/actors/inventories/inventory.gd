extends Node

var inventories = []

onready var _moduleInventory = $moduleInventory
onready var _cargoInventory = $cargoInventory
onready var _crewInventory = $crewInventory
onready var _shipInventory = $shipInventory


func _ready():
	pass


func init(owner):
	self.owner = owner
	self.inventories = [
		self._moduleInventory, 
		self._cargoInventory, 
		self._crewInventory,
		self._shipInventory]
	


func add(item):
	if item.is_type("TYPE_MODULE"):
		self._moduleInventory.add(item)
	if item.is_type("TYPE_CARGO"):
		self._cargoInventory.add(item)
	if item.is_type("TYPE_CREWMEMBER"):
		self._crewInventory.add(item)
	if item.is_type("TYPE_SHIP"):
		self._shipInventory.add(item)
	item.set_owner(self.owner)
	return item
		

func _add_ship(ship):
	self._shipInventory.add(ship)
	# Do fuck ton of other stuff
	
	
func print_inventory():
	print("Items in ", self.owner.name, " inventory")
	for inventory in self.inventories:
		for item in inventory.get_contents():
			print("name: ", item.display_name)
	print("end")
					
		
func get_test_items() -> Array:
	var items = [
		Db.get_item("Stingray", "ship"),
		Db.get_item("Whistler", "weapon"),
		Db.get_item("Whistler", "weapon"),
		Db.get_item("Whistler", "weapon"),
		Db.get_item("Whistler", "weapon"),
		Db.get_item("Whistler", "weapon"),
		Db.get_item("Johnston J-Beam", "weapon"),
		Db.get_item("Tambourine", "weapon"),
		Db.get_item("Tambourine", "weapon"),
		Db.get_item("Tambourine", "weapon"),
		Db.get_item("Tambourine", "weapon"),
		Db.get_item("Tambourine", "weapon"),
		Db.get_item("Titus, Storm-Breaker", "crewMember"),
		Db.get_item("Putt-putt", "engine"),
		Db.get_item("Rocker", "gyroscope")
		]	
	return items


func get_modules() -> Array:
	return _moduleInventory.get_contents()
	
	
func get_cargo():
	return _cargoInventory.get_contents()
	
	
func get_crew() -> Array:
	return _crewInventory.get_contents()
	
	
func get_ships() -> Array:
	return _shipInventory.get_contents()
