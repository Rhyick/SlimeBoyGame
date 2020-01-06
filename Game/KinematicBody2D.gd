extends KinematicBody2D

const UP = Vector2(0, -1)
const accerlation = 40
var lastMoment = Vector2()
var friction
export var maxSpeed = 200
export var gravity = 20
export var jumpForce = 500
var isDefault = true
var isApple = false



func _physics_process(delta):	
	lastMoment.y += gravity
	if Input.is_action_pressed("ui_right"):
		lastMoment.x = min(lastMoment.x + accerlation, maxSpeed)
		$Sprite.flip_h = false
		if isDefault == true:
			$Sprite.play("Run")
		elif isApple == true:
			$Sprite.play("AppleRun")
			pass
	elif Input.is_action_pressed("ui_left"):
		lastMoment.x = max(lastMoment.x - accerlation, -maxSpeed)
		$Sprite.flip_h = true
		if isDefault == true:
			$Sprite.play("Run")
		elif isApple == true:
			$Sprite.play("AppleRun")
			pass
	else:
		if lastMoment.y < 0:
			if isDefault == true:
				$Sprite.play("Idle")
			elif isApple == true:
				$Sprite.paly("AppleIdle")
		else:
			if isDefault == true:
				$Sprite.play("Idle")
			elif isApple == true:
				$Sprite.paly("AppleIdle")
		lastMoment.x = 0
		if isDefault == true:
			$Sprite.play("Idle")
		elif isApple == true:
			$Sprite.play("AppleIdle")
		friction = true
		
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			lastMoment.y = -jumpForce
		if friction == true:
			lastMoment.x = lerp(lastMoment.x, 0, 0.2)
	else:
		$Sprite.play("Idle")
		if friction == true:
			lastMoment.x = lerp(lastMoment.x, 0, 0.05)

	
	lastMoment = move_and_slide(lastMoment, UP)