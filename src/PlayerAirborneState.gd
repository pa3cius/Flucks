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
		parent.velocity += Vector2(0,parent.get_gravity().y * delta)
	else:
		double_jumped = false
		if parent.velocity.x:
			state_machine.transition_to_state(state_machine.parent_enum.PLAYERGROUNDEDSTATE)
		else:
			state_machine.transition_to_state(state_machine.parent_enum.PLAYERIDLESTATE)
	var direction := Input.get_axis("player_left", "player_right")
	#DASH CODE
	if Input.is_action_just_pressed("player_dash"):
		var vec = Vector2(parent.DASH_POWER, 0) * direction
		parent.velocity += vec
	#moving in the space
	var target_speed = parent.SPEED * direction
	parent.velocity.x = lerp(parent.velocity.x, target_speed, 0.2)
	if Input.is_action_just_pressed("player_jump") and !double_jumped:
		parent.velocity.y = parent.JUMP_STRENGTH * -1 
		double_jumped = true

	parent.move_and_slide()
