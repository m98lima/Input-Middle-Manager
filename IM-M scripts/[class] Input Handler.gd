extends Resource
class_name Input_Handler;

@export var mesh_name: String;
var mesh: Node3D;
var node_refs: Node_Refs;

func _assign_refs(_node_refs: Node_Refs) -> void:
	node_refs = _node_refs;
	mesh = node_refs.meshes.find_child(mesh_name);
	if (mesh == null):
		push_error("Mesh name wrong on %s, can't find mesh" % self);

	for character_mesh in node_refs.meshes.get_children():
		character_mesh.visible = false;
	mesh.visible = true;

func _setup() -> void:
	pass;

func _handle_input(event: InputEvent) -> void:
	push_error("_handle_input function not implemented!");

func _update(delta: float) -> void:
	pass;

func _physics_update(delta: float) -> void:
	pass;
