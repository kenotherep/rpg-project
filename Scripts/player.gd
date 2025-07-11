extends CharacterBody2D

@onready var rays = {"down" : $RayCastDown,"left" : $RayCastLeft,"right" : $RayCastRight,"up" : $RayCastUp}

func _ready() -> void:
	position.x = Global.player_start_posx
	position.y = Global.player_start_posy
	$StateManeger/WalkingState.rays = rays
	var anim = $AnimatedSprite2D
	$StateManeger/WalkingState.anim = anim

func player(): #For checking collisions with player !!!DO NOT REMOVE!!!
	pass 

func _physics_process(delta):
	pass
