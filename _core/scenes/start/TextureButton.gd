extends TextureButton


func _ready():
	connect("button_down", self, "_on_TextureButton_button_down")

func _on_TextureButton_button_down():
	print(Game.scene_manager.name)
	Game.scene_manager.switch_game_scenes("combat")
