extends CharacterBody2D

var speed = 350
var x_lock := 180

func _physics_process(delta):
	position.x = x_lock
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	move_and_slide()
