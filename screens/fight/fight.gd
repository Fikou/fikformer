extends Node

@onready var game = get_tree().get_root().get_child(0)

var map = ["res://screens/fight/maps/hut.tscn"]

# Called when the node enters the scene tree for the first time.
func _ready():
	game.set_music("res://assets/Cyborg Ninja.mp3")
	game.music_player.volume_db = -45.0
	set_map(map.pick_random())

func _process(delta):
	game.music_player.volume_db = min(game.music_player.volume_db + 20.0 * delta, 0)

func set_map(new_scene_path):
	var new_scene_resource: PackedScene = load(new_scene_path)
	var new_scene_instance = new_scene_resource.instantiate()
	add_child(new_scene_instance)
