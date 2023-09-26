extends Node2D

@export var object_types : Array[String] = [
	"res://key/key.tscn",
	"res://gem/gem.tscn"
]

@onready var _object_positions := $ObjectPositions
@onready var _objects := $Objects

func _ready():
	if object_types.is_empty():
		push_error("Uh oh, object types should not be empty.")
	
	for child in _object_positions.get_children():
		var scene_path : String = object_types.pick_random()
		var object : Node2D = load(scene_path).instantiate()
		object.global_position = child.global_position
		_objects.add_child(object)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$KeysLabel.text = "Keys: %d" % $Alien.keys


