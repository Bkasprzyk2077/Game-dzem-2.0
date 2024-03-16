extends Node2D

@onready var animation_player = $CanvasLayer/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("in")

func change_level(next_level):
	animation_player.play("out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(next_level)
