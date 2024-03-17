extends Node2D

@onready var area_2d = $Area2D
@onready var point_light_2d = $PointLight2D
var active = false
var red = Color("ff0000d8")
var green = Color("00ff00d8")


func _ready():
	point_light_2d.color = red

func _process(delta):
	if area_2d.overlaps_body(get_tree().get_first_node_in_group("player")):
		$TextureRect.visible = true
		if Input.is_action_just_pressed("interact"):
			if !active:
				point_light_2d.color = green
				active = true
				$AudioStreamPlayer2D.play()
			else:
				point_light_2d.color = red
				active = false
				$AudioStreamPlayer2D.play()
	else:
		$TextureRect.visible = false
