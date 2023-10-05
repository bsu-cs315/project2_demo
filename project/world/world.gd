extends Node2D

@export var object_types : Array[String] = [
	"res://key/key.tscn",
#	"res://gem/gem.tscn"
]

@onready var _object_positions := $ObjectPositions
@onready var _objects := $Objects

var _displayed_score := 0.0

func _ready():
	_spawn_player()
	
	if object_types.is_empty():
		push_error("Uh oh, object types should not be empty.")
	
	for child in _object_positions.get_children():
		var scene_path : String = object_types.pick_random()
		var object : Node2D = load(scene_path).instantiate()
		object.global_position = child.global_position
		_objects.add_child(object)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_displayed_score = lerpf(_displayed_score, float($Alien.score), 0.2)
	$KeysLabel.text = "Score: %d" % ceil(_displayed_score)
	$KeysLabel.scale.x = remap($Alien.score - _displayed_score, 0, 1000, 1.0, 5.0)
		
func _spawn_player():
	var player_character := preload("res://alien/alien.tscn").instantiate()
	player_character.global_position = $PlayerSpawnPoint.global_position
	add_child(player_character)
