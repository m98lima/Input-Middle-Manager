extends Node3D


func _play_anim(anim_name: String) -> void:
	$"AnimationPlayer".play(anim_name);
