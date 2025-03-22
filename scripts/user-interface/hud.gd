extends Node2D

func _process(delta: float) -> void:
	display_timer()
	
func display_message(message, time):
	$CanvasLayer/MessageDisplay.text = message
	$CanvasLayer/MessageDisplay.visible = true
	await get_tree().create_timer(time).timeout
	$CanvasLayer/MessageDisplay.visible = false

func _on_start_timeout() -> void:
	$CountdownTimer.start()
	$CanvasLayer/CountdownLabel.visible = true
	$CanvasLayer/MessageDisplay.visible = false


func _on_countdown_timer_timeout() -> void:
	get_tree().quit()

func display_timer():
	# Grab time left and convert it to int to do integer division on it
	var time_left = $CountdownTimer.get_time_left() as int
	
	var minutes: int = time_left / 60 # Integer division truncates decimal so this leaves us with number of minutes
	var seconds: int = time_left % 60 # Get the remainder for number of seconds
	var milliseconds: float = $CountdownTimer.get_time_left() - time_left # Total number of seconds with decimal places - Total number of seconds as an integer gives number of milliseconds
	
	# Create Strings from the numbers
	var minutes_string: String
	if minutes > 0: # Only display minutes if there's more than 1 minute left
		minutes_string = str(minutes) + ":"
	else:
		minutes_string = ""
	
	var seconds_string: String
	if seconds >= 10:
		seconds_string = str(seconds)
	else:
		seconds_string = "0" + str(seconds) # Add 0 to seconds display if there's less than 10 left
	
	var milliseconds_string: String = str(milliseconds).pad_decimals(2)
	
	var time_display: String = minutes_string + seconds_string + milliseconds_string.substr(1) # Use substring to start milliseconds_string from decimal place and ignore leading zero
	$CanvasLayer/CountdownLabel.set_text(time_display)
