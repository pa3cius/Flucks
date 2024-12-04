class_name PlayerAirborneState extends BaseState

var double_jumped = false

func enter_state() -> void:
	pass
	# parent.animation_player.play("")

func exit_state() -> void:
	pass
	# parent.animation_player.stop()

func process_state(delta : float) -> void:
	# left and right movement
	print("moving")
	if !parent.is_on_floor():
		parent.velocity += parent.get_gravity()
	else:
		if parent.velocity.x:
			state_machine.transition_to_state(parent.states.PLAYERRUNSTATE)
		else:
			state_machine.transition_to_state(parent.states.PLAYERIDLESTATE)
	var direction := Input.get_axis("player_left", "player_right")
	parent.velocity = Vector2(parent.SPEED * direction * delta, parent.velocity.y)
	parent.move_and_slide()
	if Input.is_action_just_pressed("player_jump") and double_jumped:
		state_machine.transition_to_state(parent.states.PLAYERJUMPSTATE)
