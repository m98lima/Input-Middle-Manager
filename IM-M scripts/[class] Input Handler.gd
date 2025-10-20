extends Resource
class_name Input_Handler;

var node_refs: Node_Refs;

func _assign_refs(_node_refs: Node_Refs) -> void:
	node_refs = _node_refs;

func _setup() -> void:
	pass;

func _handle_input(event: InputEvent) -> void:
	push_error("_handle_input function not implemented!");

func _update(delta: float) -> void:
	pass;

func _physics_update(delta: float) -> void:
	pass;
