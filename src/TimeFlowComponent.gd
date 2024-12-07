class_name TimeFlowComponent extends Node

signal time_flow_changed

var time_flow = 1 * TimeControlComponent.global_time_flow:
	set(new_val):
		#if get_parent().is_in_group("bullet"):
			#if time_flow == new_val and get_parent().is_in_bubble:
		time_flow *= new_val
		# print(time_flow)
		time_change = new_val
		time_flow_changed.emit()
var time_change := 1.0

func _ready() -> void:
	TimeControlComponent.global_time_change.connect(self._on_global_time_change)


func slow_down() -> void:
	time_flow = 0.5
	

func speed_up() -> void:
	time_flow = 2


func _on_global_time_change(global_time_delta : float) -> void:
	time_flow = global_time_delta
