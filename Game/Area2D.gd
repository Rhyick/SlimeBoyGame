extends Area2D

get_node("World/Player")


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			(res://KinematicBody2D.gd).isApple = true
			hey.isDefault = false
		
			
			
