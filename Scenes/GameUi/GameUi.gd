extends Control

@onready var attempts_label: Label = $MarginContainer/VBoxContainer/AttemptsLabel
@onready var music: AudioStreamPlayer2D = $Music
@onready var complete_label: VBoxContainer = $MarginContainer/CompleteLabel

var _attempts: int = -1

func _ready() -> void:
	on_attempt_made()
	
func _enter_tree() -> void:
	SignalHub.on_attempt_made.connect(on_attempt_made)
	SignalHub.on_cup_destroyed.connect(on_cup_destryoed)
	
func on_attempt_made() -> void:
	_attempts += 1
	attempts_label.text = "Attempts %s" % _attempts
	
func on_cup_destryoed(remaining_cups: int) -> void:
	if remaining_cups == 0:
		music.play()
		complete_label.show()
