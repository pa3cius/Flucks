class_name PlayerIdleState extends BaseState

func enter_state() -> void:
	parent.received_input.connect(self._on_received_input)
	# TODO: add animations

func exit_state() -> void:
	parent.received_input.disconnect(self._on_received_input)
	# TODO: add animations

func _on_received_input(event : InputEvent):
	var action := event.as_text()
	match action:
		"player_left":
			state_machine.transition_to_state(parent.states.PLAYERRUNSTATE)
		"player_right":
			state_machine.transition_to_state(parent.states.PLAYERRUNSTATE)
		"player_jump":
			state_machine.transition_to("PlayerJumpState")
