extends Node2D

const ANIMAL = preload("uid://4vfjfaymt8bu")
const MAIN = preload("uid://crie2fy10dhy4")

@onready var animal_start: Marker2D = $AnimalStart

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("return") == true:
		get_tree().change_scene_to_packed(MAIN)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)

func spawn_animal() -> void:
	var animal = ANIMAL.instantiate()
	animal.position = animal_start.position
	add_child(animal)
	
