extends CanvasLayer

@onready var pause_btn = $MarginContainer/MenuHolder/PauseBtn

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("ui_start_button"):
		visible = !visible
		get_tree().paused = visible
		pause_btn.grab_focus()


func _on_pause_btn_pressed():
	get_tree().paused = false
	visible = false


func _on_quit_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/tltle_screen.tscn")
