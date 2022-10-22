extends Node2D

onready var legA = get_node("LegA")
onready var legB = get_node("LegB")
onready var debug = get_node("DBG")

var legs
var activeLeg

export var max_lift = 100
export var speed = 3
export var fwd_speed = 6

func reset():
	legs = [0, 0]
	activeLeg = 0
	legA.position.x = 50
	legA.position.y = 37
	legB.position.x = 50
	legB.position.y = 37

func isMaxLift():
	return abs(legA.position.y - legB.position.y) > max_lift

func step(delta):

	if not (legs[0] > 0 and isMaxLift()):
		legA.move_and_collide(Vector2(fwd_speed*abs(legs[0])/2, -speed*legs[0]))
	if not (legs[1] > 0 and isMaxLift()):
		legB.move_and_collide(Vector2(fwd_speed*abs(legs[1])/2, -speed*legs[1]))

func switch_legs():
	activeLeg = (activeLeg + 1) % 2
	legs[activeLeg] = 1

func release_legs():
	legs[activeLeg] = -1

func _ready():
	reset()


func _input(event):
	if event.is_action_pressed("step"):
		switch_legs()

	if event.is_action_released("step"):
		release_legs()

	if event.is_action_pressed("reset"):
		reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	step(delta)


func _on_config_changed(new_max_lift, new_speed, new_fwd_speed, new_acceleration):
	max_lift = new_max_lift
	speed = new_speed
	fwd_speed = new_fwd_speed
