extends Control

var first_names = [
	"James", "Mary", "John", "Patricia", "Robert", "Jennifer", "Michael", "Linda",
	"William", "Elizabeth", "David", "Barbara", "Richard", "Susan", "Joseph", "Jessica",
	"Thomas", "Sarah", "Charles", "Karen", "Emma", "Liam", "Olivia", "Noah",
	"Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Harper", "Evelyn"
]

var middle_names = [
	"Mae", "Rose", "Grace", "Ann", "Marie", "Lynn", "Lee", "Jean",
	"Ray", "James", "John", "William", "Alan", "Peter", "Scott", "Dean",
	"Jane", "May", "Beth", "Anne", "Dawn", "Elle", "Faith", "Hope",
	"Jay", "Cole", "Blake", "Reid", "Kent", "Chase", "Luke", "Ross",
	"Joy", "Kate", "Ruth", "Sage", "Skye", "Paige", "Claire", "Jade",
	"Kyle", "Tate", "Finn", "Jack", "Grant", "Pierce", "Troy", "Quinn"
]

var last_names = [
	"Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis",
	"Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas",
	"Taylor", "Moore", "Jackson", "Martin", "Lee", "Thompson", "White", "Harris",
	"Clark", "Lewis", "Robinson", "Walker", "Hall", "Young", "King", "Wright"
]

@export var input_enabled: bool = false
@export var max_middle_names: int = 3

var prompt: String = ""
var player_input: String = ""
var current_letter_index: int = 0
var score: int = 0

@onready var tenant_label: RichTextLabel = $RichTextLabel

func _ready() -> void:
	prompt = _generate_name()
	tenant_label.bbcode_enabled = true
	_update_text()
	
func _unhandled_input(event: InputEvent) -> void:
	if input_enabled and event is InputEventKey and not event.is_pressed():
		if event.keycode < KEY_A or event.keycode > KEY_Z:
			return
		
		var key_typed = OS.get_keycode_string(event.keycode).to_lower()	
		var next_key = prompt.substr(current_letter_index, 1).to_lower()
	
		if next_key == " ":
			current_letter_index += 1
			next_key = prompt.substr(current_letter_index, 1).to_lower()
	
		if key_typed == next_key:
			_update_score()
			current_letter_index += 1
			print("success " + str(score))
			
			if current_letter_index >= prompt.length():
				current_letter_index = 0
				prompt = _generate_name()
		else:
			print("failure " + str(score))
			
		_update_text()
	
func _generate_name() -> String:
	var first = first_names[randi() % first_names.size()]
	var last = " " + last_names[randi() % last_names.size()]
	
	var middle = ""
	var middle_name_count = randi() % max_middle_names
	for i in range(middle_name_count):
		middle += " " + middle_names[randi() % middle_names.size()]
	
	return first + middle + last
	
func _update_score() -> void:
	score += 10 # Temporary
	
func _update_text() -> void:
	if current_letter_index <= 0:
		tenant_label.text = prompt
		return
			
	var colored_substring = prompt.substr(0, current_letter_index) # From 0 to current_letter_index
	var uncolored_substring = prompt.substr(current_letter_index) # From current_letter_index to prompt.size()
	var display_text = "[color=green]" + colored_substring + "[/color]" + uncolored_substring
	
	tenant_label.text = display_text
