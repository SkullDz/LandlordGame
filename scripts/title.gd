extends Node3D

@onready var play = $FolderMenu/Front/Playlbl
@onready var settings = $FolderMenu/Front/Settingslbl
@onready var quit = $FolderMenu/Front/Quitlbl
@onready var audio = $FolderMenu/Paper/Audio
@onready var music = $FolderMenu/Paper/Music
@onready var screenres = $FolderMenu/Paper/Screen
@onready var data = $FolderMenu/Paper/Data
@onready var main = $FolderMenu/Paper/Main

@onready var gamemanager = self.get_parent()

var hover_color = Color.RED
var normal_color = Color.BLACK


func _ready():
	$TitleAnim.play("Cam")

func _on_play_area_input_event(_camera, event, _event_position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_mask == 1:
			print("Play game")
			gamemanager.load_level(gamemanager.stamping)

func _on_settings_area_input_event(_camera, event, _event_position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_mask == 1:
			$FolderMenu/PageAnim.play("Flip")

func _on_quit_area_input_event(_camera, event, _event_position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_mask == 1:
			get_tree().quit()


func _on_area_3d_input_event(_camera, event, _event_position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_mask == 1:
			$FolderMenu/PageAnim.play_backwards("Flip")

#Hover stuff
func _on_play_area_mouse_entered():
	play.modulate = hover_color

func _on_play_area_mouse_exited():
	play.modulate = normal_color

func _on_settings_area_mouse_entered():
	settings.modulate = hover_color

func _on_settings_area_mouse_exited():
	settings.modulate = normal_color

func _on_quit_area_mouse_entered():
	quit.modulate = hover_color

func _on_quit_area_mouse_exited():
	quit.modulate = normal_color


func _on_audio_area_mouse_entered():
	audio.modulate = hover_color


func _on_audio_area_mouse_exited():
	audio.modulate = normal_color


func _on_music_area_mouse_entered():
	music.modulate = hover_color


func _on_music_area_mouse_exited():
	music.modulate = normal_color


func _on_screen_area_mouse_entered():
	screenres.modulate = hover_color


func _on_screen_area_mouse_exited():
	screenres.modulate = normal_color


func _on_data_area_mouse_entered():
	data.modulate = hover_color


func _on_data_area_mouse_exited():
	data.modulate = normal_color


func _on_area_3d_mouse_entered():
	main.modulate = hover_color


func _on_area_3d_mouse_exited():
	main.modulate = normal_color
