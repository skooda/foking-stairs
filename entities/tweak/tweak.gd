extends Node

signal config_changed

onready var max_lift = get_node("max_lift")
onready var speed = get_node("speed")
onready var fwd_speed = get_node("fwd_speed")
onready var acceleration = get_node("acceleration")
onready var defocuser = get_node("defocuser")

func _on_value_changed():
	emit_signal("config_changed", max_lift.value, speed.value, fwd_speed.value, acceleration.value)
	defocuser.grab_focus()
