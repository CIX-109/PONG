extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_left_win_area_body_entered(body: Node2D) -> void:
	OpponentScore += 1
	score()

func _on_right_win_area_body_entered(body: Node2D) -> void:
	PlayerScore += 1
	score()

func _process(delta: float) -> void:
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)

func _on_timer_timeout() -> void:
	get_tree().call_group('Ball_group','restart_ball')

func score():
	$Score.play()
	$Ball.position = Vector2(960,540)
	get_tree().call_group('Ball_group','stop_ball')
	$Timer.start()
