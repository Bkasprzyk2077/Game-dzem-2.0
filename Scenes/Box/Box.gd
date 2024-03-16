extends RigidBody2D

@onready var texture_rect = $TextureRect
@onready var interact_area = $InteractArea
var is_picked = false

func _process(delta):
	texture_rect.set_rotation(- rotation)
	var player = get_tree().get_first_node_in_group("player")
	if interact_area.overlaps_body(player):
		texture_rect.visible = true
		if Input.is_action_just_pressed("interact") and !is_picked:
			is_picked = true
		elif Input.is_action_just_pressed("interact") and is_picked:
			is_picked = false
		if is_picked:
			global_position = player.get_node("ObjectSocket").global_position
	else:
		is_picked = false
		texture_rect.visible = false
