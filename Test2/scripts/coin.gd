extends Area2D
@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.speed_scale = randf_range(1,1.2)

func _on_body_entered(body):
	if body.name=="jenny":
		Global.coin +=1
		Sounds.get_node("coin").play()
		queue_free()
