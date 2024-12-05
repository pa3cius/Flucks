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
	if !parent.is_on_floor():
		parent.velocity += Vector2(0,parent.get_gravity().y * delta)
	else:
		if parent.velocity.x:
			state_machine.transition_to_state(state_machine.parent_enum.PLAYERGROUNDEDSTATE)
		else:
			state_machine.transition_to_state(state_machine.parent_enum.PLAYERIDLESTATE)
	var direction := Input.get_axis("player_left", "player_right")
	#parent.velocity += Vector2(0, parent.velocity.y)
	
	#moving in the space
	var target_speed = parent.SPEED * direction
	parent.velocity.x = lerp(parent.velocity.x, target_speed, 0.2)

	parent.move_and_slide()
