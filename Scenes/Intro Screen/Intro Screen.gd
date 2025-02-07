extends Control

# No text background
var no_text_background = preload("res://assets/intro screen/intro background no text.jpg")

enum {INTRO, GAME_SELECT, WAIT}
var current_state = INTRO

var options = ["New Game", "Load Game", "Options Screen"]
var current_option
var current_option_number = 0

const selector_offset = 18
var selector_position


func _ready():
	# Start music
	$"Intro Song".play(0)
	
	current_state = INTRO
	
	current_option = options[current_option_number]
	
	selector_position = $"Options/Hand Selector".rect_position.y
	
	# Anim signal
	$"Anim".connect("animation_finished", self, "allow_selection")
	
	# No 3 houses
	$"Intro Background".texture = no_text_background

func _input(event):
	match current_state:
		INTRO:
			# Any key
			if event is InputEventKey and event.is_pressed():
				$"Anim".play("Options Fade In")
				current_state = WAIT
		GAME_SELECT:
			# TODO modify this to make it so the cursor can loop using modulo
			if Input.is_action_just_pressed("ui_up"):
				current_option_number -= 1
				current_option_number %= 3
				current_option_number += 3
				current_option_number %= 3
				$"Options/Hand Selector".rect_position.y = selector_position + selector_offset * current_option_number
				current_option = options[current_option_number]
				$"Options/Hand Selector/Move".play(0)
			if Input.is_action_just_pressed("ui_down"):
				current_option_number += 1
				current_option_number %= 3
				$"Options/Hand Selector".rect_position.y = selector_position + selector_offset * current_option_number
				current_option = options[current_option_number]
				$"Options/Hand Selector/Move".play(0)
			if Input.is_action_just_pressed("ui_accept"):
				$"Options/Hand Selector/Accept".play(0)
				process_selection()

func _process(delta):
	pass

func allow_selection(anim_name):
	current_state = GAME_SELECT

func process_selection():
	match current_option:
		"New Game":
			$"Anim".play("music fade out")
			set_process_input(false)
			
			# Reset game over status
			BattlefieldInfo.turn_manager.set_process(true)
			BattlefieldInfo.game_over = false
			
			# Scene change
			WorldMapScreen.current_event = Level1_WM_Event_Part10.new()
			WorldMapScreen.connect_to_scene_changer()
			SceneTransition.change_scene_to(WorldMapScreen, 0.1)
		"Load Game":
			# Stop song and fade to black
			$"Anim".play("music fade out")
			set_process_input(false)
			yield($Anim,"animation_finished")
			$"Intro Song".stop()
			
			# Make screen go dark
			$Anim.play("Fade ")
			yield($Anim, "animation_finished")
			
			# Load the game
			BattlefieldInfo.save_load_system.is_loading_level = true
			BattlefieldInfo.save_load_system.load_game()
