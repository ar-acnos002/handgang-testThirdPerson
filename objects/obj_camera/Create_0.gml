/// @description Insert description here
// You can write your code in this editor


camX = obj_player.backsideX
camY = obj_player.backsideY
camZ = -192
cameraSpeedX = 0
cameraSpeedY = 0
cameraSpeedMultiplier = obj_player.playerSpeedMultiplier
cameraLookSensitivity = 3

function distanceCorrection()
{
	var lookDistance = 128
	
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
}

distanceCorrection()