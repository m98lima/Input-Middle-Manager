extends Node;
class_name Input_Middle_Manager;

var input_handler: Input_Handler;

func _ready() -> void:
	if (!input_handler):
		input_handler = Input_Handler.new();

func _input(event: InputEvent) -> void:
	if (input_handler):
		input_handler._handle_input(event);

func _process(delta: float) -> void:
	if (input_handler):
		input_handler._update(delta);

func _physics_process(delta: float) -> void:
	if (input_handler):
		input_handler._physics_update(delta);

func _plug_new_handler(new_handler: Input_Handler) -> void:
	input_handler = new_handler;
	var node_refs = %"Node Refs" as Node_Refs;
	input_handler._assign_refs(node_refs);
	input_handler._setup();
