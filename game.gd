extends Node

const SCREEN_TITLE = "res://screens/title/title.tscn"
const SCREEN_FIGHT = "res://screens/fight/fight.tscn"
const SCREEN_UPGRADES = "res://screens/upgrades/upgrades.tscn"

var current_screen = null

# Called when the node enters the scene tree for the first time.
func _ready():
	set_screen(SCREEN_TITLE)

func set_screen(new_scene_path):
	var new_screen = load_screen(new_scene_path)
	if current_screen:
		unload_screen()
	current_screen = new_screen

func load_screen(new_scene_path):
	var new_scene_resource: PackedScene = load(new_scene_path)
	var new_scene_instance = new_scene_resource.instantiate()
	add_child(new_scene_instance)
	return new_scene_instance

func unload_screen():
	remove_child(current_screen)
	current_screen.call_deferred("free")
