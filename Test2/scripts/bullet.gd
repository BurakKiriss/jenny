extends CharacterBody2D


var hiz = 300

func _ready():
	velocity = (get_global_mouse_position()-global_position).normalized()*hiz
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	if move_and_collide(velocity*delta):
		queue_free()
	
