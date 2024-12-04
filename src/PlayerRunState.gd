class_name PlayerRunState extends BaseState

func enter_state() -> void:
	pass
	# parent.animation_player.play("")

func exit_state() -> void:
	pass
	# parent.animation_player.stop()

func process_state(delta : float) -> void:
	# left and right movement
	print("moving")
	if not parent.is_on_floor():
		state_machine.transition_to("PlayerAirborneState")
	var direction := Input.get_axis("player_left", "player_right")
	parent.velocity = Vector2(parent.SPEED * direction * delta, 0)
	parent.move_and_slide()
	
