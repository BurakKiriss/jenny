extends Control



func _ready():
	Sounds.get_node("walk").volume_db=-80




func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://.godot/exported/133200997/export-6b9c1b1fd6ae6f795188dfdc89e222b0-world.scn")


func _on_quit_button_pressed():
	get_tree().quit()
