extends Label

@onready var jenny = $"../jenny"

func _process(delta):
	text = str(Global.coin)+"/15 coin"
	jenny.get_node("gun").visible = false
	
