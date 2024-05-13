extends StaticBody2D


@onready var jenny = $"../jenny"
@onready var character_cam = $"../characterCam"


var startPos = Vector2(0, 0)

func _ready():
	startPos.y = position.y


func _physics_process(delta):
	if Global.coin==jenny.needCoin:
		
		if position.y> startPos.y -50:
			character_cam.position = position
			Global.gate =true
			
			position.y -=20*delta
			
		if Global.gate ==true:
			pass
	
				
