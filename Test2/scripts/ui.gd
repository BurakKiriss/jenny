extends CanvasLayer

@onready var count = $uiControl/count


func _physics_process(delta):
	count.text = "coin: " +str(Global.coin)
