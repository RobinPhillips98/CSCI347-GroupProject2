extends Node3D

@onready var lights = [
	$Lights/OmniLight3D, 
	$Lights/OmniLight3D2,
	$Lights/OmniLight3D3,
	$Lights/OmniLight3D4,
	$Lights/OmniLight3D5,
	$Lights/OmniLight3D6,
	$Lights/OmniLight3D7]

func _on_space_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()


func _on_lights_timer_timeout() -> void:
	$Lights/AlarmSound.play()
	for light in lights:
		light.light_color = Color.RED
	await get_tree().create_timer(1).timeout 
	for light in lights:
		light.light_color = Color.WHITE
