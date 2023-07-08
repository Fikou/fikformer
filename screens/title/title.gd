extends Control

@onready var game = get_tree().get_root().get_child(0)

func _ready():
	game.set_music("res://assets/Ancient Rite.mp3")

func _on_quit_pressed():
	get_tree().quit()

func _on_start_pressed():
	game.set_screen("res://screens/fight/fight.tscn")

func _on_credits_pressed():
	$Panel/Panel.set_visible(true)

func _on_exit_cr_pressed():
	$Panel/Panel.set_visible(false)
