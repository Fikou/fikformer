extends Node

class_name Attack

@export var Attack_Delay:float = 3
@export var bullet_scene = "res://bullets/bullet_hero_basic.tscn"

@onready var BulletScene: PackedScene = load(bullet_scene)
var time_until_next_attack = 0

var Attacker:Hero

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!Attacker):
		return
	if(Time.get_unix_time_from_system() >= time_until_next_attack):
		perform_attack(delta)
		time_until_next_attack = Time.get_unix_time_from_system() + Attack_Delay

func perform_attack(delta):
	pass

func fire_bullet(delta, direction):
	var BulletInstance = BulletScene.instantiate()
	Attacker.owner.add_child(BulletInstance)
	BulletInstance.set_position(Attacker.position)
	BulletInstance.look_at(BulletInstance.position + direction)
	pass
