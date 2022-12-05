/// @description Insert description here
// You can write your code in this editor


camX = obj_player.backsideX
camY = obj_player.backsideY
camZ = -obj_player.sprite_height
cameraSpeedX = 0
cameraSpeedY = 0
cameraSpeedMultiplier = obj_player.playerSpeedMultiplier
cameraLookSensitivity = 3

function distanceCorrection()
{
	var lookDistance = 127
	var lookHeight = 16
	
	if (camX >= 0)
	{
		camX += lookDistance
	}
	else
	{
		camX -= lookDistance
	}

	if (camY >= 0)
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