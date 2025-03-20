extends Node3D

var has_key = false
var door_open = false

# Reference to the door animation
#@onready var door_animation = $AnimationPlayer

# Connect to the player's key variable (we'll get that from the player scene)
var player = null

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and body.has_key:
		open_door()

func _ready():
	player = get_parent().get_node("Player")

func _process(delta):
	if is_player_nearby() and has_key and !door_open:
		open_door()
		
func is_player_nearby() -> bool: # Check if the player is in range (you can adjust the range here)
		return global_transform.origin.distance_to(player.global_transform.origin) < 5

func open_door():
	door_open = true
	#door_animation.play("open")  # Play the door's opening animation
	# Optionally, you could add more logic here to prevent the door from closing again
