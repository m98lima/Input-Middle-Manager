extends Input_Handler;
class_name Tank_Movement;

@export var move_speed: float;
@export var turn_speed: float;
var move_input: float;
var turn_input: float;
var move_direction: Vector3;
var character_body: CharacterBody3D;
var dashing: bool = false;
var dash_timer: Timer;


func _setup() -> void:
	character_body = node_refs.character_body;
	dash_timer = node_refs.meshes.find_child("Tank").find_child("Timer") as Timer;
	dash_timer.timeout.connect(func():
		_end_dash());

	character_body.global_basis = node_refs.camera_base.global_basis;


func _handle_input(event: InputEvent) -> void:
	if (event.is_action_pressed("Action")):
		dashing = true;
		dash_timer.start(1.2);
	else:
		move_input = Input.get_axis("Move_Forward", "Move_Back");
		turn_input = Input.get_axis("Move_Left", "Move_Right");


func _physics_update(delta: float) -> void:
	if (dashing):
		move_direction = character_body.basis.z.normalized();
		character_body._update_movement(move_direction, -move_speed * 3);
	else:
		var turn_direction = sign(move_input);
		if (turn_direction == 0):
			turn_direction = -1;
		character_body.rotate_y(delta * turn_speed * turn_input * turn_direction);
		move_direction = character_body.basis.z.normalized();
		character_body._update_movement(move_direction, move_speed * move_input);


func _end_dash() -> void:
	dashing = false;
