class_name Player extends CharacterBody2D

# Has idle, grounded, airborne, and dashing state
@export var state_machine : StateMachine
@export var SPEED := 300.0
@export var MAX_SPEED := 300.0
@export var DASH_POWER := 600.0


@export var JUMP_STRENGTH := 400.0
@export var DOUBLE_JUMP_STRENGTH := 300.0

signal received_input(event : InputEvent)

enum player_states { PLAYERIDLESTATE, 
					 PLAYERGROUNDEDSTATE, 
					 PLAYERAIRBORNESTATE,
					}

var states_dict = {
	player_states.PLAYERIDLESTATE : "PlayerIdleState",
	player_states.PLAYERGROUNDEDSTATE : "PlayerGroundedState",
	player_states.PLAYERAIRBORNESTATE : "PlayerAirborneState",
}

func _ready() -> void:
	state_machine.set_initial_state(states_dict[player_states.PLAYERAIRBORNESTATE])

#func _process(delta: float) -> void:
	#print()


func get_state_enum() -> Dictionary:
	return player_states


func get_state_dict() -> Dictionary:
	return states_dict
