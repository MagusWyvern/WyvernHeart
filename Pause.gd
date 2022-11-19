extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var canvasLayer2 = get_owner()

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state

		
