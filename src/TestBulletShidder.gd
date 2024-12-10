extends Node2D

@export var bullet: PackedScene
@export var time_flow_component: TimeFlowComponent
var counter = 0
var timer: Timer
var base_wait_time: float = 1  # Base wait time for the timer
var new_wait_time : float = base_wait_time:
	set(new_val):
		new_wait_time = new_val

func _ready() -> void:
	# Create and configure the timer
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = base_wait_time
	timer.timeout.connect(self._on_timer_timeout)
	add_child(timer)
	timer.start()

func _on_time_flow_component_time_flow_changed() -> void:
	print(timer.wait_time, " ", timer.time_left, " ", time_flow_component.time_flow)
	new_wait_time = 1 / time_flow_component.time_flow
	timer.wait_time = timer.time_left / time_flow_component.time_change
	print(new_wait_time, " ", timer.wait_time)
	timer.start()  # Restart the timer to apply changes

func _on_timer_timeout() -> void:
	
	timer.wait_time = new_wait_time
	var bullet_instance = bullet.instantiate() as Area2D
	add_child(bullet_instance)
	timer.start()
