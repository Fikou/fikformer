extends Control

@export var PlayerRef:Player
@export var MaxHealth:float = 6

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progressbar = get_node("TextureProgressBar")
	progressbar.value = (PlayerRef.health / MaxHealth) * 100
	pass
