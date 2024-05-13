extends CharacterBody2D


var hiz 
var vel = 1
var can = 3
@onready var sprite_2d = $Sprite2D
@onready var can_bari = $canBari

func  _ready():
	hiz = randi_range(100,130)
	velocity.x = hiz
	
func _physics_process(delta):
	can_bari.value=can
	if can ==0:
		queue_free()
	
	if is_on_wall():
		vel = -hiz * sign(vel)
		velocity.x = vel
	
	
	if sign(velocity.x)==-1:
		sprite_2d.flip_h=true
	else:
		sprite_2d.flip_h=false	
		
		
	move_and_slide()	


func _on_bullet_box_body_entered(body):
	if body.is_in_group("bullet"):
		can -=1
		body.queue_free()
