extends "res://Scripts/EntityBase.gd"

signal health_updated(health)
signal killed()

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
#const MAXSPEED = 50
var JUMPFORCE = 380
const ACCELERATION = 20
var should_change_animation = true
var is_attacking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = clamp(velocity.x, -SPEED, SPEED)

func _physics_process(_delta):
	velocity.y += GRAVITY

	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED
	
	if velocity.x == 0:
		$AnimatedSprite.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
