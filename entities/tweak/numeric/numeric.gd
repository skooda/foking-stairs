extends Node2D
signal value_changed

# Declare member variables here. Examples:
# var a = 2
export var label = "text"
export var value = 0


onready var Label = get_node("Label")
onready var Input = get_node("Input")

# Called when the node enters the scene tree for the first time.
func _ready():
	Label.text = label
	Input.text = String(value)

func _on_Input_text_entered(new_text):
	value = int(new_text)
	Input.text = String(value)
	emit_signal("value_changed")
