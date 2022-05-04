extends Node2D

var music = load("res://Scenes/OST_Celestial_Caves.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	add_child(music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/Menu.tscn")

