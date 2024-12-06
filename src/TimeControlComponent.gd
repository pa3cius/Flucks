extends Node

signal global_time_change(time_flow : float, time_delta : float)

var global_time_flow_multiplier : float = 1:
	set(new_val):
		global_time_delta = new_val / global_time_flow_multiplier
		global_time_flow_multiplier = new_val
		global_time_change.emit(global_time_flow_multiplier, global_time_delta)
var global_time_delta := 1.0
		
func global_slow_down() -> void:
	TimeControlComponent.global_time_flow_multiplier /= 2


func global_speed_up() -> void:
	TimeControlComponent.global_time_flow_multiplier *= 2
