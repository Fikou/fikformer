extends Control

@onready var game = get_tree().get_root().get_child(0)

func _on_button_pressed():
	game.set_screen("res://screens/fight/fight.tscn")
