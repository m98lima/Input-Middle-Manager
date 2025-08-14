extends CanvasLayer

var is_paused: bool;

func _start_paused() -> void:
	_pause_game(true);

func _pause_game(pause_state: bool):
	if (pause_state):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE;
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);

	is_paused = pause_state;
	visible = is_paused;
	get_tree().paused = is_paused;

func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
	#if (is_paused):
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
	if (event.is_action_pressed("Pause")):
		_pause_game(!is_paused);
