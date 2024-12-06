extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.is_in_group("time_puppet"))
	if body.is_in_group("time_puppet"):
		body.get_node("TimeFlowComponent").slow_down()
	if body.is_in_group("player"):
		body.get_node("TimeControlComponent").global_speed_up()
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("time_puppet"):
		body.get_node("TimeFlowComponent").speed_up()
	if body.is_in_group("player"):
		body.get_node("TimeControlComponent").global_slow_down()
