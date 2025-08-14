extends Input_Handler;
class_name Frog_Movement;

@export var vertical_speed: float;
@export var move_force: float;
@export var deceleration: float;
var is_moving: bool = false;
var current_speed: float;
var input_direction: Vector3;
var move_direction: Vector3;
var character_body: CharacterBody3D;
var camera_base: Node3D;
var is_enabled: bool = true;

func _setup() -> void:
	character_body = node_refs.character_body;
	camera_base = node_refs.camera_base;
	current_speed = 0;
	is_moving = false;

	mesh.enable_input.connect(func(): is_enabled = true);

func _handle_input(event: InputEvent) -> void:
	if (!is_enabled):
		return;

	if (!is_moving):
		var move_h = Input.get_axis("Move_Left", "Move_Right");
		var move_z = Input.get_axis("Move_Forward", "Move_Back");

		var x_direction = camera_base.basis.x;
		var z_direction = camera_base.basis.z;

		x_direction *= move_h;
		z_direction *= move_z;

		input_direction.x = x_direction.x + z_direction.x;
		input_direction.z = x_direction.z + z_direction.z;
		input_direction = input_direction.normalized()

		if (input_direction):
			mesh._play_anim("Compress spring");
			var new_z = -input_direction;
			var new_x = Vector3.UP.cross(new_z);
			var new_basis = Basis(new_x, Vector3.UP, new_z).orthonormalized();
			
			character_body.basis = new_basis;
			move_direction = input_direction;

			if (event.is_action_pressed("Action")):
				is_moving = true;
				current_speed = move_force;
				character_body._update_movement(move_direction, move_force);
				character_body.velocity.y = vertical_speed;
				mesh._play_anim("Jump");
				is_enabled = false;
		else:
			if (!is_moving && mesh.current_anim != "Release spring"):
				mesh._play_anim("Release spring");
				return;




func _physics_update(delta: float) -> void:
	if (is_moving && character_body.is_on_floor()):
		mesh._play_anim("Landing");
		move_direction = Vector3.ZERO;
		is_moving = false;
		character_body._update_movement(move_direction, current_speed);
	if (!character_body.is_on_floor()):
		is_moving = true;
