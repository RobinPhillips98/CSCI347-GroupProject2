extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.collect_key()
		#key_model.visible = false
		queue_free()  # Remove key after pickup
