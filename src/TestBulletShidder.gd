extends Node2D

@export var bullet: PackedScene
@export var time_flow_component: TimeFlowComponent
var timer: Timer
var base_wait_time: float = 1.0  # Base wait time for the timer
var new_wait_time : float = base_wait_time

func _ready() -> void:
	# Create and configure the timer
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = base_wait_time
	timer.timeout.connect(self._on_timer_timeout)
	add_child(timer)
	timer.start()

func _on_time_flow_component_time_flow_changed() -> void:
	new_wait_time = base_wait_time / time_flow_component.time_flow
	timer.wait_time = timer.time_left / time_flow_component.time_change
	timer.start()  # Restart the timer to apply changes

func _on_timer_timeout() -> void:
	timer.wait_time = new_wait_time
	add_child(bullet.instantiate())
	timer.start()
