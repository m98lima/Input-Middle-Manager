extends Node

var camera_base: Node3D;
var spring_arm: SpringArm3D;
var mouse_sensitivity: float = 0.002;

func _ready() -> void:
	var node_refs = %"Node Refs" as Node_Refs;
	camera_base = node_refs.camera_base;
	spring_arm = camera_base.get_node("SpringArm3D");

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera_base.rotate_y(-event.relative.x * mouse_sensitivity);
		spring_arm.rotate_x(-event.relative.y * mouse_sensitivity);
		
		var cam_rot = spring_arm.rotation_degrees;
		cam_rot.x = clamp(cam_rot.x, -45, 5);
		spring_arm.rotation_degrees = cam_rot;
