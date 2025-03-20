extends Area3D

func _physics_process(delta: float) -> void:
	rotate_y(delta)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.collect_key()
		body.display_message("I got the key! Now to get out of here!", 2)
		#key_model.visible = false
		queue_free()  # Remove key after pickup
