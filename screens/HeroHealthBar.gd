extends Control

@export var HeroRef:Hero
@export var MaxHealth:int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progressbar = get_node("TextureProgressBar")
	progressbar.value = HeroRef.health / MaxHealth
	pass
