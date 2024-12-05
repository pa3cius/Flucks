class_name PlayerAirborneState extends BaseState

var double_jumped = false

func enter_state() -> void:
	double_jumped = false
	# parent.animation_player.play("")

func exit_state() -> void:
	pass
	# parent.animation_player.stop()

func process_state(delta : float) -> void:
	# left and right movement
	if !parent.is_on_floor():
		parent.velocity += parent.get_gravity() * delta
	else:
		if parent.velocity.x:
			state_machine.transition_to_state(state_machine.parent_enum.PLAYERGROUNDEDSTATE)
		else:
			state_machine.transition_to_state(state_machine.parent_enum.PLAYERIDLESTATE)
	var direction := Input.get_axis("player_left", "player_right")
	parent.velocity = Vector2(parent.SPEED * direction * delta, parent.velocity.y)
	if Input.is_action_just_pressed("player_jump") and !double_jumped:
		parent.velocity.y = parent.JUMP_STRENGTH * -1 
		double_jumped = true
	parent.move_and_slide()
