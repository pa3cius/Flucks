class_name StateMachine extends Node

var current_state : BaseState

@onready var parent_enum = get_parent().get_state_enum()
@onready var parent_state_dict = get_parent().get_state_dict()

func _ready() -> void:
	for child in get_children():
		if child is BaseState:
			child.set_parent(get_parent())
			
# In the state machine script
func transition_to_state(state_enum):
	var state = parent_state_dict[state_enum]
	transition_to(state)


func set_initial_state(state_name: String):
	current_state = get_node(state_name)
	current_state.enter_state()

func transition_to(new_state: String):
	if current_state:
		current_state.exit_state()
	current_state = get_node(new_state)
	current_state.enter_state()

func _process(delta) -> void:
	if current_state:
		current_state.process_state(delta)
