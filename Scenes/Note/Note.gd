extends Node2D

@onready var canvas_layer = $CanvasLayer
@onready var area_2d = $Area2D

func _process(delta):
	if area_2d.overlaps_body(get_tree().get_first_node_in_group("player")):
		if Input.is_action_just_pressed("interact"):
			if !canvas_layer.visible:
				canvas_layer.visible = true
			else:
				canvas_layer.visible = false
	else:
		canvas_layer.visible = false
