extends Control

func _on_quit_pressed():
	get_tree().quit()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://screens/fight/fight.tscn")

func _on_credits_pressed():
	$Panel/Panel.set_visible(true)

func _on_exit_cr_pressed():
	$Panel/Panel.set_visible(false)
