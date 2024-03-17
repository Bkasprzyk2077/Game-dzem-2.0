extends Sprite2D

@onready var animatable_body_2d = $AnimatableBody2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += 2 * delta
	animatable_body_2d.set_rotation(- rotation)
	if audio_stream_player_2d.playing == false:
		audio_stream_player_2d.play()
