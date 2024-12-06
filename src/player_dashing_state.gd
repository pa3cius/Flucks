class_name PlayerDashingState extends BaseState

func enter_state() -> void:
	pass
	# parent.animation_player.play("")

func exit_state() -> void:
	pass
	# parent.animation_player.stop()

func process_state(delta : float) -> void:
	# left and right movement
	if !parent.is_on_floor():
		state_machine.transition_to_state(state_machine.parent_enum.PLAYERAIRBORNESTATE)
	var direction := Input.get_axis("player_left", "player_right")
	parent.velocity.x = parent.SPEED * direction * delta
	if Input.is_action_just_pressed("player_jump"):
		parent.velocity.y = parent.JUMP_STRENGTH * -1
		state_machine.transition_to_state(state_machine.parent_enum.PLAYERAIRBORNESTATE)
	parent.move_and_slide()
	
