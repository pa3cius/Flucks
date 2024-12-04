class_name PlayerIdleState extends BaseState

func enter_state() -> void:
	parent.received_input.connect(self._on_received_input)
	# TODO: add animations

func exit_state() -> void:
	parent.received_input.disconnect(self._on_received_input)
	# TODO: add animations

func process_state(delta : float) -> void:
	push_error("process_state() not implemented in " + self.name)

func _on_received_input(event : InputEvent):
	var action := event.as_text()
	match action:
		"player_left":
			
