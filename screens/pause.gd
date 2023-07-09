extends Control

@onready var game = get_tree().get_root().get_child(0)

var paused = false:
	get:
		return paused
	set(value):
		set_visible(value)
		paused = value
		get_tree().paused = value

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		paused = !paused


func _on_unpause_pressed():
	paused = false


func _on_quit_pressed():
	paused = false
	game.set_screen("res://screens/title/title.tscn")


func _on_mute_toggled(button_pressed):
	if(button_pressed):
		game.music_player.volume_db = -100.0
	else:
		game.music_player.volume_db = 0.0
