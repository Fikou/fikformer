extends Control

@export var PlayerRef:Player
@export var MaxHealth:int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progressbar = get_node("ProgressBar")
	progressbar.value =  PlayerRef.health / MaxHealth
	pass
