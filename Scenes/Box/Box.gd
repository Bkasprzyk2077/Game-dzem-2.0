extends RigidBody2D

@onready var interact_area = $InteractArea
var is_picked = false

func _process(delta):
	var player = get_tree().get_first_node_in_group("player")
	if interact_area.overlaps_body(player):
		if Input.is_action_just_pressed("interact") and !is_picked:
			is_picked = true
		elif Input.is_action_just_pressed("interact") and is_picked:
			is_picked = false
		if is_picked:
			global_position = player.get_node("ObjectSocket").global_position
	else:
		is_picked = false
