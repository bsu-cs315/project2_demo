extends Node2D

const _OBJECT_TYPES := [
	preload("res://key/key.tscn"),
	preload("res://gem/gem.tscn"),
]

@onready var _object_positions := $ObjectPositions
@onready var _objects := $Objects

func _ready():
	for child in _object_positions.get_children():
		var object : Node2D = _OBJECT_TYPES.pick_random().instantiate()
		object.global_position = child.global_position
		_objects.add_child(object)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$KeysLabel.text = "Keys: %d" % $Alien.keys


