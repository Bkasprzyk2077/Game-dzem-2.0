extends Node2D

@onready var animation_player = $CanvasLayer/AnimationPlayer
@export var path_to_self: String

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("in")

func change_level(next_level):
	print(next_level)
	animation_player.play("out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(next_level)
	
func _process(delta):
	if $BgAudio.playing == false:
		$BgAudio.play()


func _on_fall_detector_body_entered(body):
	if body == get_tree().get_first_node_in_group("player"):
		change_level(path_to_self)
