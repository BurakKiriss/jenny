extends  CharacterBody2D

@export var speed= 15000
@export var gravity= 800
@export var jumpVelocity= -400
@export var needCoin=0

@onready var bulletSpawn = $"../bullets"
@onready var fire = $fire

@onready var cam = $"../characterCam"

@onready var animated_sprite_2d = $AnimatedSprite2D

var move = true
var act
var canAttack = false

@onready var walking = $walking
@onready var gun = $gun
@onready var bulletPos = $gun/bulletPos


func _physics_process(delta):
	var dir = Input.get_action_strength("right")-Input.get_action_strength("left")
	
	if dir and move==true :
		velocity.x = dir * speed * delta
		Sounds.get_node("walk").volume_db=0
		if dir>0:
			animated_sprite_2d.play("run")
			gun.offset.x=12
			bulletPos.position.x=0
			animated_sprite_2d.flip_h=false
		elif dir<0:
			animated_sprite_2d.play("run")
			gun.offset.x=12
			bulletPos.position.x=-0
			animated_sprite_2d.flip_h=true
				
	else:
		velocity.x = move_toward(velocity.x,0,1000*delta)
		animated_sprite_2d.play("idle")
		Sounds.get_node("walk").volume_db=-80
		
	cam.position = lerp(cam.position, position, 5*delta)
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jumpVelocity
	else:
		velocity.y += gravity*delta	
		animated_sprite_2d.play("jump")
		Sounds.get_node("walk").volume_db=-80
	
	
	gun.look_at(get_global_mouse_position())
	
	if get_global_mouse_position().x < gun.position.x:
		
		gun.flip_v=true
	else:
		
		gun.flip_v=false
		
	


		move_and_slide()


func _on_damage_body_entered(body):
	if body.is_in_group("enemy"):
		Sounds.get_node("hurtjenny").play()
		Global.coin = 6
		get_tree().reload_current_scene()
		
func objeYap(objeYol, pos, child):
	var obje = load(objeYol).instantiate()
	obje.position = pos
	child.add_child(obje)		

func _input(event):
	if event.is_action_pressed("leftclick") and canAttack ==true:
		objeYap("res://scenes/bullet.tscn", bulletPos.global_position, bulletSpawn)
		fire.play()
