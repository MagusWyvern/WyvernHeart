extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")
onready var grassEffect = GrassEffect.instance()
onready var world = get_tree().current_scene

func create_grass_effect():
	world.add_child(grassEffect)
	grassEffect.global_position = global_position


func _on_Hurtbox_area_entered(_area):
	create_grass_effect()
	queue_free()
