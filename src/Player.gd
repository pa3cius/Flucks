class_name Player extends CharacterBody2D

@onready var state_machine : StateMachine = $StateMachine
@export var SPEED := 300.0
@export var JUMP_STRENGTH := 400.0
@export var DOUBLE_JUMP_STRENGTH := 300.0

signal received_input(event : InputEvent)

enum player_states {PLAYERIDLESTATE, PLAYERRUNSTATE, PLAYERAIRBORNESTATE}

var states_dict = {
	player_states.PLAYERIDLESTATE : "PlayerIdleState",
	player_states.PLAYERRUNSTATE : "PlayerRunState",
	player_states.PLAYERAIRBORNESTATE : "PlayerAirborneState"
}

func _ready() -> void:
	state_machine.set_initial_state(states_dict[player_states.PLAYERAIRBORNESTATE])

func _input(event: InputEvent) -> void:
	received_input.emit(event)

func get_enum() -> Dictionary:
	return player_states
