class_name TimeFlowComponent extends Node

signal time_flow_changed

var time_flow = TimeControlComponent.global_time_flow_multiplier:
	set(new_val):
		time_change = new_val / time_flow
		time_flow = time_flow * time_change
		time_flow_changed.emit()

var time_change := 1.0

func _ready() -> void:
	TimeControlComponent.global_time_change.connect(self._on_global_time_change)


func slow_down() -> void:
	self.time_flow/=2
	

func speed_up() -> void:
	self.time_flow*=2


func _on_global_time_change(global_time_flow : float, _time_change : float) -> void:
	self.time_flow = global_time_flow
