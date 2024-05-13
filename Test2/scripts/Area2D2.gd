extends Area2D




func _on_body_entered(body):
	if body.name=="jenny":
		get_tree().change_scene_to_file("res://scenes/world_two.tscn")
		Sounds.get_node("opendoor").play()
		
		Global.coin=6
