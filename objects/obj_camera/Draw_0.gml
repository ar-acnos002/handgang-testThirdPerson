/// @description Insert description here
// You can write your code in this editor

cameraSpeedX = obj_player.playerSpeedX
cameraSpeedY = obj_player.playerSpeedY
cameraRadius = point_distance(camX, camY, obj_player.x, obj_player.y)

var roomCentreX = room_width/2
var roomCentreY = room_height/2

var playerX = obj_player.x
var playerY = obj_player.y

var cameraAngle = point_direction(playerX, playerY, camX, camY)
show_debug_message("Camera Angle: "+string(cameraAngle))

var camera = camera_get_active()

if (keyboard_check(vk_space) == true)
{
	viewMiniMap = true
	
	#region minimap camera
	
	camViewMat = matrix_build_lookat(roomCentreX, roomCentreY, -12000, roomCentreX, roomCentreY, 0, 0, 1, 0)
	
	camProjMat = matrix_build_projection_perspective_fov(35.5, room_width/room_height, 1, 12000)
	
	#endregion
}
else
{
	viewMiniMap = false
	
	#region third person camera
	
	var camOriginX = camX
	var camOriginY = camY
	var camOriginZ = camZ

	if (keyboard_check(ord("A")) == true)
	{
		var newCameraAngle = cameraAngle + 1*cameraLookSensitivity
		
		camOriginX = playerX + cameraRadius * dcos(newCameraAngle)
		camOriginY = playerY - cameraRadius * dsin(newCameraAngle)
	}

	if (keyboard_check(ord("D")) == true)
	{
		var newCameraAngle = cameraAngle - 1*cameraLookSensitivity
		
		camOriginX = playerX + cameraRadius * dcos(newCameraAngle)
		camOriginY = playerY - cameraRadius * dsin(newCameraAngle)
	}
	
	camOriginX += cameraSpeedX * cameraSpeedMultiplier
	camOriginY += cameraSpeedY * cameraSpeedMultiplier

	camX = camOriginX
	camY = camOriginY
	camZ = camOriginZ

	var camViewMat = matrix_build_lookat(camX, camY, camZ, playerX, playerY, -obj_player.sprite_height, 0, 0, 1)

	var camProjMat = matrix_build_projection_perspective_fov(72.5, 640/384, 1, 2000)
	
	#endregion
}

camera_set_view_mat(camera, camViewMat)
camera_set_proj_mat(camera, camProjMat)

camera_apply(camera)