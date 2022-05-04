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

onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = clamp(velocity.x, -SPEED, SPEED)

func _physics_process(_delta):
	velocity.y += GRAVITY

	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED
	
	if velocity.x == 0:
		$AnimatedSprite.play("idle")
	
	if player:
		var distanceToPlayer = player.position - self.position
		
		if distanceToPlayer.x - self.position.x == 25:
			if distanceToPlayer.x < distanceToPlayer.y:
				distanceToPlayer.y = 0
			elif distanceToPlayer.y > self.position.y:
				velocity.y = -JUMPFORCE
			else:
				distanceToPlayer.x = 0
			
		velocity.x =  ACCELERATION * distanceToPlayer.x
		
	if velocity.y > 20:
		$AnimatedSprite.play("fall")
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
