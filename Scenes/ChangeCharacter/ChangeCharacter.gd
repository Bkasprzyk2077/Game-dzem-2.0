extends Node2D

@onready var area_2d = $Area2D
@onready var texture_rect = $TextureRect
@export var new_character: PackedScene

func _process(delta):
	if area_2d.overlaps_body(get_tree().get_first_node_in_group("player")):
		texture_rect.visible = true
		if Input.is_action_just_pressed("interact"):
			change_character()
			queue_free()
			
func change_character():
	var new_character_instance = new_character.instantiate()
	var player = get_tree().get_first_node_in_group("player")
	var player_pos = player.global_position
	get_parent().add_child(new_character_instance)
	player.queue_free()
	new_character_instance.global_position = player_pos + Vector2(0, -200)
	
