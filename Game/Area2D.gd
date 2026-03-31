extends Area2D

#onready var playerApple = get_node("World/Player")


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			print("yes!")
			Global.isApple = true
			body.isApple = true
			body.isDefault = false
			Global.isDefault = false
		
			
			
