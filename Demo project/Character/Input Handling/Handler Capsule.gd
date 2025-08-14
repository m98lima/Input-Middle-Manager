extends Node

@export var input_handlers: Array[Input_Handler];
var active_handler: int = 0;
var input_middle_manager: Input_Middle_Manager;

func _ready() -> void:
	input_middle_manager = get_parent();
	_replace_active_handler()


func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("Select_Handler")):
		var index = event.as_text() as int;
		if (active_handler == index - 1):
			return;
		active_handler = index - 1;
		get_child(0).play("Swap meshes");


func _replace_active_handler() -> void:
	input_middle_manager._plug_new_handler(input_handlers[active_handler]);
