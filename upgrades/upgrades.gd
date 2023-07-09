extends Panel

@onready var game = get_tree().get_root().get_child(0)

func _ready():
	game.set_music("res://assets/Level Up.mp3")

