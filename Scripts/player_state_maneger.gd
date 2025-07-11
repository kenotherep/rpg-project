extends Node

var pause = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!pause):
		$WalkingState.state_process(delta)
	elif Dialogic.current_timeline == null:
		unpause()

func unpause():
	pause = false

func _on_walking_state_pause() -> void:
	pause = true
