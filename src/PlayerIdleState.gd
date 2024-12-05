class_name PlayerIdleState extends BaseState

func enter_state() -> void:
	# parent.received_input.connect(self._on_received_input)
	# TODO: add animations
	pass
func exit_state() -> void:
	# parent.received_input.disconnect(self._on_received_input)
	# TODO: add animations
	pass
func process_state(delta : float) -> void:
	if Input.is_action_just_pressed("player_left") or Input.is_action_just_pressed("player_right"):
		state_machine.transition_to_state(state_machine.parent_enum.PLAYERGROUNDEDSTATE)
	if Input.is_action_just_pressed("player_jump"):
		parent.velocity.y += parent.JUMP_STRENGTH * -1 
		state_machine.transition_to_state(state_machine.parent_enum.PLAYERAIRBORNESTATE)
		parent.move_and_slide()
