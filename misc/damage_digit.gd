extends Node2D

var value: int = 999

func _ready():
	%Label.text = str(value)
