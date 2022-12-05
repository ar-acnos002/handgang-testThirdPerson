/// @description Insert description here
// You can write your code in this editor

cameraSpeedX = obj_player.playerSpeedX
cameraSpeedY = obj_player.playerSpeedY

var camera = camera_get_active()

var camOriginX = camX
var camOriginY = camY
var camOriginZ = camZ
cameraRadius = point_distance(camX, camY, obj_player.x, obj_player.y)

if (keyboard_check(ord("A")) == true)
{
	if (camOriginX > obj_player.x)
	{
		camOriginY -= cameraLookSensitivity
	}
	else
	{
		camOriginY += cameraLookSensitivity
	}
	
	if (camOriginY > obj_player.y)
	{
		camOriginX += cameraLookSensitivity
	}
	else
	{
		camOriginX -= cameraLookSensitivity
	}
}

if (keyboard_check(ord("D")) == true)
{
	if (camOriginX > obj_player.x)
	{
		camOriginY += cameraLookSensitivity
	}
	else
	{
		camOriginY -= cameraLookSensitivity
	}
	
	if (camOriginY > obj_player.y)
	{
		camOriginX -= cameraLookSensitivity
	}
	else
	{
		camOriginX += cameraLookSensitivity
	}
}

camOriginX += cameraSpeedX * cameraSpeedMultiplier
camOriginY += cameraSpeedY * cameraSpeedMultiplier

camX = camOriginX
camY = camOriginY
camZ = camOriginZ

var camViewMat = matrix_build_lookat(camX, camY, camZ, obj_player.x, obj_player.y, -obj_player.sprite_height, 0, 0, 1)

var camProjMat = matrix_build_projection_perspective_fov(72.5, 640/384, 1, 2000)

camera_set_view_mat(camera, camViewMat)
camera_set_proj_mat(camera, camProjMat)

camera_apply(camera)