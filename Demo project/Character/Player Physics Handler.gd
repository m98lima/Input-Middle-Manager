extends CharacterBody3D

@onready var default_gravity = ProjectSettings.get_setting("physics/3d/default_gravity");
var gravity: float;

func _ready() -> void:
	gravity = default_gravity;


func _physics_process(delta):
	if (!is_on_floor()):
		velocity.y -= gravity * delta

	if (velocity != Vector3.ZERO):
		$"Meshes/Amogus2"._play_anim("Walk");
	else:
		$"Meshes/Amogus2"._play_anim("RESET");

	move_and_slide();


func _update_movement(direction: Vector3, speed: float) -> void:
	velocity.x = direction.normalized().x * speed;
	velocity.z = direction.normalized().z * speed;

func _update_movement_ignore_gravity(direction: Vector3, speed: float) -> void:
	velocity = direction.normalized() * speed;
	_set_gravity_scale(0);

func _set_gravity_scale(scale: float = 1):
	gravity = default_gravity * scale;
