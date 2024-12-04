class_name BaseState extends Node

@onready var state_machine : StateMachine = get_parent()
# base state class, all other states should extend this class
var parent : Node

func set_parent(parent_instance : Node) -> void:
	parent = parent_instance

func enter_state() -> void:
	push_error("enter_state() not implemented in " + self.name)


func exit_state() -> void:
	push_error("exit_state() not implemented in " + self.name)


func process_state(delta : float) -> void:
	pass
