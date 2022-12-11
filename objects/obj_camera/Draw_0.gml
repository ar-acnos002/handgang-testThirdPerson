/// @description Insert description here
// You can write your code in this editor

var camOriginX = camX
var camOriginY = camY
var camOriginZ = camZ

var playerX = obj_player.x
var playerY = obj_player.y
var playerHeight = -obj_player.sprite_height

var roomCentreX = room_width/2
var roomCentreY = room_height/2

cameraAngle = obj_player.playerDirection+180
if (cameraAngle > 360)
{
	cameraAngle -= 360
}
else if (cameraAngle < 0)
{
	cameraAngle += 360
}

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

	camOriginX = playerX + cameraRadius * dcos(cameraAngle)
	camOriginY = playerY - cameraRadius * dsin(cameraAngle)
	
	camX = camOriginX
	camY = camOriginY
	camZ = camOriginZ

	var camViewMat = matrix_build_lookat(camX, camY, camZ, playerX, playerY, playerHeight, 0, 0, 1)

	var camProjMat = matrix_build_projection_perspective_fov(72.5, 640/384, 1, 2000)
	
	#endregion
}

camera_set_view_mat(camera, camViewMat)
camera_set_proj_mat(camera, camProjMat)

camera_apply(camera)