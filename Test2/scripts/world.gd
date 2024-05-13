extends Node2D

@onready var jenny = $jenny
@onready var character_cam = $characterCam

@onready var walksound = $sounds/walksound

@onready var gatesound = $sounds/gatesound
@onready var doorsound = $sounds/doorsound

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("restart"):
		Global.coin=0
		get_tree().reload_current_scene()
	
	jenny.get_node("gun").visible =false
	
		
		
		


func _on_gatesound_area_entered(area):
	jenny.move=false
	gatesound.play()
	
	




func _on_gate_finish_area_entered(area):
	jenny.move=true
