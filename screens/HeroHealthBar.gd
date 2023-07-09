extends Control

@export var HeroRef:Hero
@export var MaxHealth:float = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progressbar = get_node("TextureProgressBar")
	progressbar.value = (HeroRef.health / MaxHealth) * 100
	pass
