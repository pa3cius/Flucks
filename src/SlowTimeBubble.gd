extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("time_puppet"):
		body.is_in_bubble = true
		body.get_node("TimeFlowComponent").slow_down()
	if body.is_in_group("player"):
		body.get_node("TimeControlComponent").global_speed_up()
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("time_puppet"):
		body.get_node("TimeFlowComponent").speed_up()
		body.is_in_bubble = false
	if body.is_in_group("player"):
		body.get_node("TimeControlComponent").global_slow_down()
