extends Input_Handler;
class_name Moai_Movement;

@export var cursor_speed: float;
var character_body: CharacterBody3D;
var cursor: Node3D;
var camera_base: Node3D;
var tween: Tween;
var move_direction: Vector3;

func _setup():
	character_body = node_refs.character_body
	camera_base = node_refs.camera_base;
	cursor = mesh.get_node("Cursor");

	mesh.global_position = character_body.global_position;
	cursor.global_position = mesh.global_position;
	mesh.global_basis = camera_base.global_basis;


func _handle_input(event: InputEvent):
	if (cursor.is_available && (event.is_action_pressed("Action"))):
		_teleport();

	var move_h = Input.get_axis("Move_Left", "Move_Right");
	var move_z = Input.get_axis("Move_Forward", "Move_Back");

	var x_direction = camera_base.basis.x;
	var z_direction = camera_base.basis.z;

	x_direction *= move_h;
	z_direction *= move_z;

	move_direction.x = x_direction.x + z_direction.x;
	move_direction.z = x_direction.z + z_direction.z;
	move_direction = move_direction.normalized();


func _physics_update(delta: float):
	cursor.translate(move_direction * cursor_speed * delta);


func _teleport():
	var spring_arm = cursor.get_node("SpringArm3D") as SpringArm3D;
	mesh.global_position = spring_arm.global_position
	mesh.global_position.y -= spring_arm.get_hit_length();

	var new_z = (character_body.global_position - mesh.global_position).normalized();
	var new_x = Vector3.UP.cross(new_z).normalized();
	var new_basis = Basis(new_x, Vector3.UP, new_z).orthonormalized();
	mesh.global_basis = new_basis;

	if (tween):
		tween.kill();
	tween = character_body.create_tween();
	tween.set_parallel(false);
	tween.tween_property(mesh, "scale", Vector3(1, 1, 1), 0.1);
	tween.tween_property(character_body, "global_position", mesh.global_position, 0.4);
	tween.set_ease(Tween.EASE_IN_OUT);
	tween.play();
