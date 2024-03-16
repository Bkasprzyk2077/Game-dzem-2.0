extends Node2D

@onready var canvas_layer = $CanvasLayer
@onready var area_2d = $Area2D
@onready var label = $CanvasLayer/TextureRect/Label
@onready var texture_rect = $CanvasLayer/TextureRect

func _process(delta):
	if area_2d.overlaps_body(get_tree().get_first_node_in_group("player")):
		texture_rect.visible = true
		if Input.is_action_just_pressed("interact"):
			if !canvas_layer.visible:
				canvas_layer.visible = true
				load_text()
			else:
				canvas_layer.visible = false
	else:
		canvas_layer.visible = false
		texture_rect.visible = false

func load_text():
	var tween = create_tween()
	label.visible_ratio = 0.0
	#label.text = get("text"+str(t)+"_"+str(n)) + "[/color]"
	tween.tween_property(
		label, "visible_ratio", 1.0, 1
	)
	#tween.start()
