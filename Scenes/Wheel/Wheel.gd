extends Sprite2D

@onready var animatable_body_2d = $AnimatableBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += 2 * delta
	animatable_body_2d.set_rotation(- rotation)
