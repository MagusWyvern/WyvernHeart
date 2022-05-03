extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 50
var JUMPFORCE = 350
const ACCELERATION = 10

var motion = Vector2()

onready var attackcd = $AttackCooldown

#onready var player = get_node("../Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	if attackcd.is_stopped():
		$Sprite.animation = "attack"
		$Sprite.play()
#		player.damage(10)
#		attackcd.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if motion.x > 0 || motion.x < 0:
		$Sprite.animation = "walk"
		$Sprite.play()
	else:
		$Sprite.animation = "idle"
		$Sprite.play()
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)

	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	
	motion = move_and_slide(motion, UP)
