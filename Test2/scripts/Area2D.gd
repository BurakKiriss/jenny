extends Area2D





func _on_body_entered(body):
	if body.name=="jenny":
		Global.coin =0
		Sounds.get_node("hurtjenny").play()
		get_tree().reload_current_scene()
