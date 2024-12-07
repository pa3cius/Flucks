extends Area2D

@export var speed : float
@export var time_flow_component : TimeFlowComponent
var is_in_bubble = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x += speed * delta * time_flow_component.time_flow
