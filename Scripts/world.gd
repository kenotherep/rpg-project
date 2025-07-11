extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_clifside_exit_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transitioning_scenes = true
		if Global.current_scene == "world":
			Global.current_scene = "cliffside"
			Global.player_start_posx = 5
			Global.player_start_posy = 130
			Global.finish_changing_scene()
			get_tree().change_scene_to_file("res://Scenes/cliffside.tscn")

func _on_clifside_exit_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transitioning_scenes = false
