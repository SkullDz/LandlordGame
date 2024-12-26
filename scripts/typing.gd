extends Control

var first_names = [
	"James", "Mary", "John", "Patricia", "Robert", "Jennifer", "Michael", "Linda",
	"William", "Elizabeth", "David", "Barbara", "Richard", "Susan", "Joseph", "Jessica",
	"Thomas", "Sarah", "Charles", "Karen", "Emma", "Liam", "Olivia", "Noah",
	"Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Harper", "Evelyn"
]

var last_names = [
	"Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis",
	"Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas",
	"Taylor", "Moore", "Jackson", "Martin", "Lee", "Thompson", "White", "Harris",
	"Clark", "Lewis", "Robinson", "Walker", "Hall", "Young", "King", "Wright"
]

var prompt: String = ""
var player_input: String = ""
var current_letter_index: int = 0

@onready var tenant_label: RichTextLabel = $RichTextLabel

func _ready():
	prompt = _generate_name()
	tenant_label.bbcode_enabled = true
	_update_text()
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var key_typed = OS.get_keycode_string(event.keycode).to_lower()	
		var next_key = prompt.substr(current_letter_index, 1).to_lower()
	
		if next_key == " ":
			current_letter_index += 1
	
		if key_typed == next_key:
			print("success")
			current_letter_index += 1
		else:
			print("failure")
			
		if current_letter_index >= prompt.length():
			current_letter_index = 0
			prompt = _generate_name()
			
		_update_text()
	
func _generate_name() -> String:
	var first = first_names[randi() % first_names.size()]
	var last = last_names[randi() % last_names.size()]
	return first + " " + last
	
func _update_text() -> void:
	var display_text = ""
	
	# This is a really dumb way to do this, change this later
	for i in range(prompt.length()):
		if i < current_letter_index:
			display_text += "[color=green]" + prompt[i] + "[/color]"
		else:
			display_text += prompt[i]
	
	tenant_label.text = display_text
