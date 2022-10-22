extends Node2D

onready var legA = get_node("LegA")
onready var legB = get_node("LegB")
onready var debug = get_node("DBG")

var legs = [0, 0] # 0, 0 | 1, 0 | -1, 0 | 0, 1 | 0, -1 |
var activeLeg = 0
var speed = 3
var forwardSpeed = 6
var maxLift = 10

func isMaxLift():
	return abs(legA.position.y - legB.position.y)

func step(delta):
	legA.move_and_collide(Vector2(forwardSpeed*abs(legs[0])/2, -speed*legs[0]))
	legB.move_and_collide(Vector2(forwardSpeed*abs(legs[1])/2, -speed*legs[1]))

func switch_legs():
	activeLeg = (activeLeg + 1) % 2
	legs[activeLeg] = 1
	debug.text = String(legs)
	
func release_legs():
	legs[activeLeg] = -1
	debug.text = String(legs)

func _input(event):
	if event.is_action_pressed("step"):
		switch_legs()

	if event.is_action_released("step"):
		release_legs()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	step(delta)
