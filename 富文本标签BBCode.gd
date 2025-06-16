extends Control

func _ready() -> void:
	var content : String
	var arry : Array

	arry.append("[i]斜体[/i]\t斜体\n")
	
	arry.append("[i]粗体[/i]\n")
	
	for i in arry.size():
		content += arry[i]
	$RichTextLabel.text = content

func _on_RichTextLabel_meta_clicked(meta):
	var err = OS.shell_open(meta)
	if err == OK:
		print("Opened link '%s' successfully!" % meta)
	else:
		print("Failed opening the link '%s'!" % meta)

func _on_pause_toggled(button_pressed):
	get_tree().paused = button_pressed
