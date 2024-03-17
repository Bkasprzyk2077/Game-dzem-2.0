extends Node2D

@onready var audio_stream_player_2d = $AudioStreamPlayer2D


func _on_area_2d_body_entered(body):
	if body == get_tree().get_first_node_in_group("player"):
		audio_stream_player_2d.play()
