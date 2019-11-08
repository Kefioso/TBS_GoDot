extends Camera2D

class_name MainCamera

const CAMERA_CURSOR_DIFFERENTIAL_FACTOR = 1
const CAMERA_WIDTH = 240
const CAMERA_HEIGTH = 160
var RIGHT_CLAMP_MAX
var BOTTOM_CLAMP_MAX

signal camera_moved

func _ready():
	# Return to this camera when the unit is done moving
	BattlefieldInfo.unit_movement_system.connect("unit_finished_moving", self, "set_current_camera")

# Update the camera on cursor movement
func _on_Cursor_cursorMoved(direction, cursor_position):
	match direction:
		"up":
			if abs(position.y - cursor_position.y) <= (Cell.CELL_SIZE * CAMERA_CURSOR_DIFFERENTIAL_FACTOR):
				position += Vector2(0,-Cell.CELL_SIZE)
				clampCameraPosition()
				emit_signal("camera_moved", position)
		"down":
			if abs((position.y + CAMERA_HEIGTH - Cell.CELL_SIZE) - cursor_position.y) <= (Cell.CELL_SIZE * CAMERA_CURSOR_DIFFERENTIAL_FACTOR):
				position += Vector2(0,Cell.CELL_SIZE)
				emit_signal("camera_moved", position)
		"left":
			if abs(position.x - cursor_position.x) <= (Cell.CELL_SIZE * CAMERA_CURSOR_DIFFERENTIAL_FACTOR):
				position += Vector2(-Cell.CELL_SIZE,0)
				clampCameraPosition()
				emit_signal("camera_moved", position)
		"right":
			if abs((position.x + CAMERA_WIDTH - Cell.CELL_SIZE) - cursor_position.x) <= (Cell.CELL_SIZE * CAMERA_CURSOR_DIFFERENTIAL_FACTOR):
				position += Vector2(Cell.CELL_SIZE,0)
				clampCameraPosition()
				emit_signal("camera_moved", position)
	
# Sets the parameters for the maximum camera movement once the level is loaded
func _on_Level_mapInformationLoaded():
	limit_bottom = (BattlefieldInfo.map_height * Cell.CELL_SIZE)
	limit_right = (BattlefieldInfo.map_width * Cell.CELL_SIZE)
	RIGHT_CLAMP_MAX = (BattlefieldInfo.map_width * Cell.CELL_SIZE) - CAMERA_WIDTH
	BOTTOM_CLAMP_MAX = (BattlefieldInfo.map_height * Cell.CELL_SIZE) - CAMERA_HEIGTH
	
# Prevent out of bounds for the camera
func clampCameraPosition():
	# Clamp
	position.x = clamp(position.x, 0, RIGHT_CLAMP_MAX)
	position.y = clamp(position.y, 0, BOTTOM_CLAMP_MAX)

# Set back to this camera
func set_current_camera():
	# Remove other camera
	BattlefieldInfo.current_Unit_Selected.get_node("MovementCamera").queue_free()
	current = true