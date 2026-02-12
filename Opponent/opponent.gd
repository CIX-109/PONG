extends CharacterBody2D

var speed = 350
var x_lock := 1740
var ball

func _ready() -> void:
	ball = get_parent().get_node("Ball")
	
func _physics_process(delta: float) -> void:
	position.x = x_lock
	velocity = Vector2(0,get_opponent_direction() * speed)
	move_and_slide()
	
func get_opponent_direction():
	if abs(ball.position.y - position.y) > 15:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
