class_name PlayerGroundedState extends BaseState

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
		
		
	#MOVEMENT CODE
	var direction := Input.get_axis("player_left", "player_right")
	var target_speed = parent.SPEED * direction
	parent.velocity.x = lerp(parent.velocity.x, target_speed, 0.2)


		
	
	if Input.is_action_just_pressed("player_jump"):
		parent.velocity.y += parent.JUMP_STRENGTH * -1
		state_machine.transition_to_state(state_machine.parent_enum.PLAYERAIRBORNESTATE)
	if Input.is_action_just_pressed("player_dash"):
		var vec = Vector2(600, 0) * direction
		parent.velocity += vec
	parent.move_and_slide()
	
