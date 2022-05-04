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

export (float) var max_health = 100

#onready var iframes = $Iframes
onready var health = max_health setget _set_health


var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity.x = clamp(velocity.x, -SPEED, SPEED)
	
	velocity.y += GRAVITY
	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED
		
	if Input.is_action_pressed("right"):
		velocity.x += ACCELERATION
#		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0

	elif Input.is_action_pressed("left"):
		velocity.x -= ACCELERATION
#		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0

	elif Input.is_action_pressed("attack"):
		if $AttackCooldown.is_stopped():
			print("Attacking!")
			is_attacking = true
			$AttackCooldown.start()
	else: 
		velocity.x = lerp(motion.x, 0, 0.2)
		
		
	if velocity.y > 20:
		$AnimatedSprite.play("fall")
#		should_change_animation = false
	elif velocity.y < 0:
		$AnimatedSprite.play("jump")
		should_change_animation = false
	elif velocity.x > 0 || velocity.x < 0:
		if should_change_animation:
			$AnimatedSprite.animation = "walk"
			$AnimatedSprite.play()
	elif is_attacking == true:
		$AnimatedSprite.play("attack")
	else:
		$AnimatedSprite.play("idle")
		should_change_animation = true

	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			velocity.y = -JUMPFORCE
		
#			damage(25)
	
	print(velocity.y)
#	velocity = move_and_slide(velocity)

func damage(amount):
#	if iframes.is_stopped():
#		iframes.start()
#		_set_health(health - amount)
	pass

func kill():
	pass

func _set_health(value):
	
	var prev_health = health
	health = clamp(value, 0, max_health)
	
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()
			emit_signal("killed")
		


func _on_AnimatedSprite_animation_finished():
	is_attacking = false # Replace with function body.
	should_change_animation = true
