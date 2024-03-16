extends Node2D

@export var next_level = "res://Levels/level_1.tscn"

func _on_area_2d_body_entered(body):
	if body != get_tree().get_first_node_in_group("player"):
		return
	print("test")
	get_tree().change_scene_to_file(next_level)
