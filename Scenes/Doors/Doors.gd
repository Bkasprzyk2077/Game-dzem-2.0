extends Node2D

@onready var area_2d = $Area2D
@onready var start = $Start
@onready var end = $End
@export var key: Node


func _process(delta):
	if key == null:
		return
	if key.active:
		open()
	else:
		close()

func open():
	var tween = get_tree().create_tween()
	tween.tween_property(area_2d, "position", end.position, 1)

func close():
	var tween = get_tree().create_tween()
	tween.tween_property(area_2d, "position", start.position, 1)
