extends Node3D

@onready var door_animation = $AnimationPlayer
@onready var area = $Area3D
@onready var player = get_node("/root/World/Player")
var door_open = false
var message_seen = false

func _process(delta):
	if Input.is_action_pressed("door_open") and is_player_nearby() and not door_open:
		if player.has_key:
			open_door()
		else:
			player.display_message("I need the key!", 1)
		
func is_player_nearby() -> bool: # Check if the player is in range 
		return global_transform.origin.distance_to(player.global_transform.origin) < 5

func open_door():
	door_open = true
	$CollisionShape3D.disabled = true
	door_animation.play("door_animation")
	await door_animation.animation_finished
	queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if message_seen or player.has_key:
		return
	else:
		if body.has_method("display_message"):
			body.display_message("The door's locked! The key is in the room I passed below!", 2)
