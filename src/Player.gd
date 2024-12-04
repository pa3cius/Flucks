class_name Player extends CharacterBody2D

@onready var state_machine : StateMachine = $StateMachine
@export var SPEED := 300.0
@export var JUMP_STRENGTH := 400.0
@export var DOUBLE_JUMP_STRENGTH := 300.0

signal received_input(event : InputEvent)

func _ready() -> void:
	state_machine.set_initial_state("PlayerIdle")
	
func _input(event: InputEvent) -> void:
	received_input.emit(event)
