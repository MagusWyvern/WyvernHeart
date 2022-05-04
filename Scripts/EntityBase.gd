extends KinematicBody2D

# The int in these declaration stands for integer, not intelligence
export(int) var hp_max: int = 100
export(int) var hp: int = hp_max
export(int) var mana: int = 100
export(int) var defense: int = 0

# This is the maximum speed allowed for all entities
export(int) var SPEED: int = 50
var velocity: Vector2 = Vector2.ZERO

# Allow usage of variables in every children
onready var sprite = $AnimatedSprite
onready var collisionShape = $CollisionShape2D
onready var animationPlayer = $AnimationPlayer

func _physics_process(_delta):
	move()
	
func move():
	velocity = move_and_slide(velocity, Vector2.UP)
	
func die():
	queue_free()
