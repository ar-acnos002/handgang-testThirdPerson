/// @description Insert description here
// You can write your code in this editor


camX = obj_player.backsideX
camY = obj_player.backsideY
camZ = -obj_player.sprite_height
cameraSpeedX = 0
cameraSpeedY = 0
cameraSpeedMultiplier = obj_player.playerSpeedMultiplier
cameraLookSensitivity = obj_player.playerSpeedMultiplier/2

viewMiniMap = false

function distanceCorrection()
{
	var lookDistance = obj_player.sprite_height-1
	var lookHeight = obj_player.sprite_height/8
	
	if (camX >= room_width/2)
	{
		camX += lookDistance
	}
	else
	{
		camX -= lookDistance
	}

	if (camY >= room_height/2)
	{
		camY += lookDistance
	}
	else
	{
		camY -= lookDistance
	}
	
	camZ -= lookHeight
}

distanceCorrection()