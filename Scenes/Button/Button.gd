extends Node2D

@onready var animation_player = $AnimationPlayer
var active = false

func _process(delta):
	print(active)

func _on_area_top_body_entered(body):
	if body.is_in_group("box"):
		animation_player.play("press")
		await animation_player.animation_finished
		active = true

func _on_area_top_body_exited(body):
	if body.is_in_group("box"):
		active = false
		animation_player.play("out")
		animation_player.animation_finished
