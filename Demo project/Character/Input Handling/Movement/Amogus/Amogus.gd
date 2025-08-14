extends Input_Handler;
class_name Amogus_Movement;

@export var move_speed: float;
@export var turning_weight: float;
@export var jump_force: float;
@export var base_gravity: float = 1;
@export var falling_gravity: float = 1;
var move_direction: Vector3;
var character_body: CharacterBody3D;
var camera_base: Node3D;

func _setup() -> void:
	character_body = node_refs.character_body;
	camera_base = node_refs.camera_base;

	character_body._set_gravity_scale(base_gravity);

func _handle_input(event: InputEvent) -> void:
	if (event.is_action_pressed("Action") && character_body.is_on_floor()):
		character_body.velocity.y = jump_force;

	var move_h = Input.get_axis("Move_Left", "Move_Right");
	var move_z = Input.get_axis("Move_Forward", "Move_Back");

	var x_direction = camera_base.basis.x;
	var z_direction = camera_base.basis.z;

	x_direction *= move_h;
	z_direction *= move_z;

	move_direction.x = x_direction.x + z_direction.x;
	move_direction.z = x_direction.z + z_direction.z;
	move_direction = move_direction.normalized()

	character_body._update_movement(move_direction, move_speed);

func _physics_update(delta: float) -> void:
	if (move_direction != Vector3.ZERO):
		var new_z = -move_direction;
		var new_x = Vector3.UP.cross(new_z);
		var new_basis = Basis(new_x, Vector3.UP, new_z).orthonormalized();
		
		character_body.basis = character_body.basis.slerp(new_basis, turning_weight * delta);

	if (character_body.is_on_floor()):
		character_body._set_gravity_scale(base_gravity);
	elif (character_body.velocity.y < 0.5):
		character_body._set_gravity_scale(falling_gravity);
