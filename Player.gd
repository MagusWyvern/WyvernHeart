extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 50
var JUMPFORCE = 350
const ACCELERATION = 10

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)

	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	if Input.is_action_pressed("right"):
		motion.x += ACCELERATION
		$Sprite.animation = "walk"
		$Sprite.flip_v = false
		$Sprite.flip_h = motion.x < 0
		$Sprite.play()
	elif Input.is_action_pressed("left"):
		motion.x -= ACCELERATION
		$Sprite.animation = "walk"
		$Sprite.flip_v = false
		$Sprite.flip_h = motion.x < 0
		$Sprite.play()
	else: 
		motion.x = lerp(motion.x, 0, 0.2)
		
		
	if motion.x > 0 || motion.x < 0:
		$Sprite.animation = "walk"
		$Sprite.play()
	else:
		$Sprite.animation = "idle"
		$Sprite.play()

	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion, UP)
