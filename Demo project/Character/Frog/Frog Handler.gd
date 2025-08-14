@tool
extends Node3D

signal enable_input;

@export var frog_mesh: MeshInstance3D;
@export var frog_scale: float = 1:
	get:
		return frog_scale;
	set(value):
		if (frog_mesh):
			frog_mesh.scale = Vector3(value, value, value);
		frog_scale = value;
@export var spring_mesh: MeshInstance3D;
@export var spring_scale: float = 1.0:
	get:
		return spring_scale;
	set(value):
		value = clamp(value, .5, 1.3);
		spring_mesh.scale.y = value;
		spring_scale = value;
@export var anim_player: AnimationPlayer;
var current_anim: String = "";


func _play_anim(anim_name: String):
	if (current_anim != anim_name):
		anim_player.play(anim_name);
		current_anim = anim_name;


func _process(_delta: float) -> void:
	frog_mesh.global_basis = spring_mesh.global_basis.orthonormalized() * .5;


func _reenable_input():
	enable_input.emit();
