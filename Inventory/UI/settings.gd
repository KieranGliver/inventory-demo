extends DragableControl

class_name SettingsUI

@onready var scale_slider = $SettingList/Scale/HSlider
@onready var fullscreen_check = $SettingList/Fullscreen/CheckBox 

func _ready():
	super._ready()
	fullscreen_check.button_pressed = SettingsManager.fullscreen
	

func _on_close_button_pressed():
	hide()


func _on_h_slider_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
		SettingsManager.scale_val = scale_slider.value


func _on_check_box_toggled(button_pressed):
	SettingsManager.fullscreen = button_pressed
