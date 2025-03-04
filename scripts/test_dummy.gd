extends StaticBody3D

var health = 3

func take_damage():
	health -= 1
	print("Ouch I took damage. My health is " + str(health))
	
	if health <= 0:
		print("I'm dead")
		queue_free()
