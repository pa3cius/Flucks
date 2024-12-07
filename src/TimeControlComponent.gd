extends Node

signal global_time_change(time_flow : float,)

var global_time_flow_delta : float = 1:
	set(new_val):
		global_time_flow_delta = new_val
		global_time_flow *= global_time_flow_delta
		print("global delta ", global_time_flow_delta)
		global_time_change.emit(global_time_flow_delta)
var global_time_flow : float = 1

func global_slow_down() -> void:
	TimeControlComponent.global_time_flow_delta = 0.5


func global_speed_up() -> void:
	TimeControlComponent.global_time_flow_delta = 2
