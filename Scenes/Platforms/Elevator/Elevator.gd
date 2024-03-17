extends Node2D

@onready var static_body_2d = $StaticBody2D
@onready var start = $Start
@onready var end = $End
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@export var key: Node
@export var time_to_reach: float
var is_moving = false

func _physics_process(delta):
	if audio_stream_player_2d.playing == false:
		audio_stream_player_2d.play()
	if key == null:
		if is_moving:
			return
		is_moving = true
		var tween = get_tree().create_tween()
		tween.tween_property(static_body_2d, "position", end.position, time_to_reach)
		await tween.finished
		var tween2 = get_tree().create_tween()
		tween2.tween_property(static_body_2d, "position", start.position, time_to_reach)
		await tween2.finished
		is_moving = false
	elif key.active:
		if is_moving:
			return
		is_moving = true
		var tween = get_tree().create_tween()
		tween.tween_property(static_body_2d, "position", end.position, time_to_reach)
		await tween.finished
		var tween2 = get_tree().create_tween()
		tween2.tween_property(static_body_2d, "position", start.position, time_to_reach)
		await tween2.finished
		is_moving = false
		

func go_up():
	var tween = get_tree().create_tween()
	tween.tween_property(static_body_2d, "position", end.position, time_to_reach)
	await tween.finished
	print("TEST")

func go_down():
	var tween = get_tree().create_tween()
	tween.tween_property(static_body_2d, "position", start.position, time_to_reach)
	await tween.finished
