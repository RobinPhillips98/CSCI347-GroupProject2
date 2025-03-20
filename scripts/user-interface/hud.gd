extends Node2D

func _process(delta: float) -> void:
	$CanvasLayer/CountdownLabel.set_text(str($CountdownTimer.get_time_left()).pad_decimals(0))

func _on_start_timeout() -> void:
	$CountdownTimer.start()
	$CanvasLayer/CountdownLabel.visible = true
	$CanvasLayer/MessageDisplay.visible = false


func _on_countdown_timer_timeout() -> void:
	get_tree().quit()
