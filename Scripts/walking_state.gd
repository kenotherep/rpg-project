extends Node

const SPEED = 100

var rays
var current_dir = "down"
var anim

signal pause

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(delta: float) -> void:
	player_movement(delta)
	if Input.is_action_just_pressed("in_A"):
			check_interact()

func player_movement(delta):
	if Input.is_anything_pressed():
		
		play_anim(true)
		
		if Input.is_action_pressed("in_right"):
			current_dir = "right"
			owner.velocity.x = SPEED
			owner.velocity.y = 0
			if Input.is_action_pressed("in_down"):
				owner.velocity.x = sqrt(pow(SPEED,2)/2)
				owner.velocity.y = sqrt(pow(SPEED,2)/2)
			elif Input.is_action_pressed("in_up"):
				owner.velocity.x = sqrt(pow(SPEED,2)/2)
				owner.velocity.y = (sqrt(pow(SPEED,2)/2)) * -1
		elif Input.is_action_pressed("in_left"):
			current_dir = "left"
			owner.velocity.x = -SPEED
			owner.velocity.y = 0
			if Input.is_action_pressed("in_down"):
				owner.velocity.x = (sqrt(pow(SPEED,2)/2)) * -1
				owner.velocity.y = sqrt(pow(SPEED,2)/2)
			elif Input.is_action_pressed("in_up"):
				owner.velocity.x = (sqrt(pow(SPEED,2)/2)) * -1
				owner.velocity.y = (sqrt(pow(SPEED,2)/2)) * -1
		elif Input.is_action_pressed("in_down"):
			current_dir = "down"
			owner.velocity.x = 0
			owner.velocity.y = SPEED
		elif Input.is_action_pressed("in_up"):
			current_dir = "up"
			owner.velocity.x = 0
			owner.velocity.y = -SPEED
		else:
			play_anim(false)
			owner.velocity.x = 0
			owner.velocity.y = 0
	else:
		play_anim(false)
		owner.velocity.x = 0
		owner.velocity.y = 0
	
	owner.move_and_slide()
	
func check_interact():
	var current_ray = rays[current_dir]
	if current_ray.is_colliding():
		var body = current_ray.get_collider()
		if body.has_method("interaction"):
			body.interaction()
			pause.emit()
			
func play_anim(movement: bool):
	var dir = current_dir
	
	if dir == "right":
		anim.flip_h = false
		if movement:
			anim.play("side_walk")
		else:
			anim.play("side_idle")
	elif dir == "left":
		anim.flip_h = true
		if movement:
			anim.play("side_walk")
		else:
			anim.play("side_idle")
	elif dir == "up":
		anim.flip_h = false
		if movement:
			anim.play("back_walk")
		else:
			anim.play("back_idle")
	else:
		anim.flip_h = false
		if movement:
			anim.play("front_walk")
		else:
			anim.play("front_idle")
