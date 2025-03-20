extends Node3D

@onready var door_animation = $AnimationPlayer
@onready var area = $Area3D
@onready var player = get_node("/root/World/Player")
var has_key = false
var door_open = false

func _process(delta):
	if Input.is_action_pressed("door_open") and player.has_key and is_player_nearby() and !door_open:
		open_door()
		
func is_player_nearby() -> bool: # Check if the player is in range 
		return global_transform.origin.distance_to(player.global_transform.origin) < 5

func open_door():
	door_open = true
	$CollisionShape3D.disabled = true
	door_animation.play("door_animation")
