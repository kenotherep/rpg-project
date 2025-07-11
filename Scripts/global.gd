extends Node

var current_scene = "world"
var transitioning_scenes = false

var player_start_posx = 352
var player_start_posy = 54

func finish_changing_scene():
	if transitioning_scenes == true:
		
		transitioning_scenes = false
