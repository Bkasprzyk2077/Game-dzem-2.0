extends Node2D

@onready var area_2d = $Area2D
@onready var start = $Start
@onready var end = $End
@export var key: Node
@export var time: float = 1
@export var close_time: float = 1


func _process(delta):
	if key == null:
		return
	if key.active:
		open(time)
	else:
		close()

func open(time):
	var tween = get_tree().create_tween()
	tween.tween_property(area_2d, "position", end.position, time)

func close():
	var tween = get_tree().create_tween()
	tween.tween_property(area_2d, "position", start.position, close_time)
