extends Control

@onready var game = get_tree().get_root().get_child(0)

func _ready():
	game.set_music("res://assets/Ancient Rite.mp3")

func _on_quit_pressed():
	get_tree().quit()

func _on_start_pressed():
	game.set_screen("res://screens/intro/Introduction.tscn")

func _on_credits_pressed():
	$Panel2.set_visible(true)

func _on_exit_cr_pressed():
	$Panel2.set_visible(false)
