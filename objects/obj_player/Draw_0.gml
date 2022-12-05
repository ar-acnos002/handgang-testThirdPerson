/// @description Insert description here
// You can write your code in this editor


shader_set(shader_billboarding)

var transMat = matrix_build(x, y, z, 0, 0, 0, 1, 1, 1)

matrix_set(matrix_world, transMat)

draw_sprite(sprite_index, image_index, 0, 0)

matrix_set(matrix_world, matrix_build_identity())

shader_reset()

playerSpeedX = 0
playerSpeedY = 0

if (keyboard_check(ord("W")) == true)
{
	var camX = obj_camera.camX
	var camY = obj_camera.camY

	playerSpeedX = abs(x - camX)
	playerSpeedY = abs(y - camY)

	if (playerSpeedX > playerSpeedY)
	{
		playerSpeedY = playerSpeedY/playerSpeedX
		playerSpeedX = 1

	}
	else
	{
		playerSpeedX = playerSpeedX/playerSpeedY
		playerSpeedY = 1
	}

	if (x < camX)
	{
		playerSpeedX *= -1
	}
	if (y < camY)
	{
		playerSpeedY *= -1
	}
}

else if (keyboard_check(ord("S")) == true)
{
	var camX = obj_camera.camX
	var camY = obj_camera.camY

	playerSpeedX = abs(x - camX)
	playerSpeedY = abs(y - camY)

	if (playerSpeedX > playerSpeedY)
	{
		playerSpeedY = playerSpeedY/playerSpeedX
		playerSpeedX = 1

	}
	else
	{
		playerSpeedX = playerSpeedX/playerSpeedY
		playerSpeedY = 1
	}

	if (x > camX)
	{
		playerSpeedX *= -1
	}
	if (y > camY)
	{
		playerSpeedY *= -1
	}
}

x += playerSpeedX * playerSpeedMultiplier
y += playerSpeedY * playerSpeedMultiplier