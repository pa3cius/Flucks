class_name StateMachine extends Node

var current_state : BaseState = null

func set_initial_state(state_name: String):
	current_state = get_node(state_name)
	current_state.enter_state()

func transition_to(new_state: String):
	if current_state:
		current_state.exit_state()
	current_state = get_node(new_state)
	current_state.enter_state()

func _process(delta):
	if current_state:
		current_state.state_process(delta)
