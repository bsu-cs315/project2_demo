extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$KeysLabel.text = "Keys: %d" % $Alien.keys
