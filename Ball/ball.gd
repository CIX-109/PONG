extends CharacterBody2D

var speed
var rng := RandomNumberGenerator.new()

func _ready():
	restart_ball()

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.get_normal())
		$Bounce.play()

func stop_ball():
	speed = 0

func restart_ball():
	speed = 500
	rng.randomize()
	velocity = Vector2(
		[-1.0, 1.0][rng.randi() % 2],
		[-0.8, 0.8][rng.randi() % 2]
	)
