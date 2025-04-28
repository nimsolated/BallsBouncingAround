extends Node

var rng: RandomNumberGenerator

func _ready() -> void:
	rng = RandomNumberGenerator.new()
	rng.randomize()

func _unhandled_input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed(&"ui_up")):
		var newBall = preload("res://scenes/ball.tscn").instantiate()
		match rng.randi_range(0, 3):
			0:
				newBall.color = Color.WHITE
			1:
				newBall.color = Color.RED
			2:
				newBall.color = Color.BLUE
			3:
				newBall.color = Color.GREEN
			_:
				newBall.color = Color.BLACK
		add_child(newBall)
	elif (Input.is_action_just_pressed(&"ui_down")):
		if (get_children().is_empty()):
			return
		else:
			get_children()[get_children().size() - 1].queue_free()
