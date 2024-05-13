extends Node2D
@onready var cam = $characterCam
@onready var jenny = $jenny


func _physics_process(delta):
	jenny.get_node("gun").visible = true
	jenny.canAttack=true
