extends "res://Scripts/EntityBase.gd"

signal health_updated(health)
signal killed()

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
var JUMPFORCE = 380
const ACCELERATION = 0.2
var should_change_animation = true
var is_attacking = false

onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = clamp(velocity.x, -2, 2)

func _physics_process(_delta):
	velocity.y += GRAVITY
#	print(velocity.x)

	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_hurtbox_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$Control/HealthBar.value -= 10
	hp -= 10
