extends Node3D

@onready var door_animation = $AnimationPlayer
@onready var area = $Area3D
@onready var player = get_node()
var has_key = false
var door_open = false


#func _ready():
	#player = get_parent().get_node("Player")

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and body.has_key:
		open_door()

func _process(delta):
	if is_player_nearby() and has_key and !door_open:
		open_door()
		

func open_door():
	door_open = true
	$CollisionShape3D.disabled = true
	door_animation.play("door_animation")
