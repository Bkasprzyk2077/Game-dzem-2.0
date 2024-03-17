extends CanvasLayer

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("in")

func _on_play_button_pressed():
	animation_player.play("out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
