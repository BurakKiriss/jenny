extends Area2D







func _on_body_entered(body):
	if body.name =="jenny":
		Sounds.get_node("opendoor").play()
		get_tree().change_scene_to_file("res://scenes/world_three.tscn")
