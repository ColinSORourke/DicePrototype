@tool
extends ColorRect

var BGBar: Node

# Comment Here to test Git

@export
var border: Color:
	get:
		return border
	set(value):
		border = value
		color = value
@export
var background: Color:
	get:
		return background
	set(value):
		background = value
		updateChildren()
@export
var fill: Color:
	get:
		return fill
	set(value):
		fill = value
		updateChildren()
		
@export
var borderVal:int:
	set(value):
		if (borderVal * 2 < size.y and borderVal * 2 < size.x):
			borderVal = value
			updateChildren()

@export_group("values")
@export var min: int:
	set(value):
		if (value < max):
			min = value
			if (lower < min):
				lower = min
			if (higher < min):
				higher = min
			updateChildren()
@export var max: int:
	set(value):
		if (value > min):
			max = value
			if (lower > max):
				lower = max
			if (higher > max):
				higher = max
			updateChildren()
@export var lower: int:
	set(value):
		if (value <= max and value >= min and value <= higher):
			lower = value
			updateChildren()
			
@export var higher: int:
	set(value):
		if (value <= max and value >= min and value >= lower):
			higher = value
			updateChildren()

func updateChildren():
	if (get_child_count() > 0):
		get_child(0).color = background
		calcBGBar();
		if (get_child(0).get_child_count() > 0):
			get_child(0).get_child(0).color = fill
			calcFillBar()
	
func calcBGBar():
	get_child(0).size.x = size.x - borderVal * 2
	get_child(0).size.y = size.y - borderVal * 2
	get_child(0).position.x = borderVal
	get_child(0).position.y = borderVal

func calcFillBar():
	get_child(0).get_child(0).size.x = float(higher-lower+1)/(max-min+1) * get_child(0).size.x
	get_child(0).get_child(0).position.x = float(lower-min)/(max-min+1) * get_child(0).size.x
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
