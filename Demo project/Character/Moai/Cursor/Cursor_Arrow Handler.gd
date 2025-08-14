extends Node3D


@export var unavailable_color: Color;
@export var mesh: MeshInstance3D;
var available_color: Color;
var is_available: bool = true;
var material: StandardMaterial3D;

func _ready() -> void:
	if (!mesh):
		push_error("Mesh not assigned to Cursor Handler script");
		return;
	material = mesh.get_active_material(0) as StandardMaterial3D;
	available_color = material.albedo_color;

func _set_unavailable(_arg) -> void:
	_change_color(unavailable_color);
	is_available = false;

func _set_available(_arg) -> void:
	_change_color(available_color);
	is_available = true;

func _change_color(new_color: Color) -> void:
	material.albedo_color = new_color;
