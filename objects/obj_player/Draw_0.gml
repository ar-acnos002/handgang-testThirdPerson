/// @description Insert description here
// You can write your code in this editor


if (obj_camera.viewMiniMap)
{
	sprite_index = spr_minimap_player
	image_blend = make_color_hsv(0, 0, 255)
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, image_blend, 100)
}
else
{
	#region regular processing

	#region drawing sprite billboarded

	shader_set(shader_billboarding)

	var transMat = matrix_build(x, y, z, 0, 0, 0, 1, 1, 1)

	matrix_set(matrix_world, transMat)

	//sprite_index = spr_1P
	sprite_index = spr_1P
	draw_sprite(sprite_index, image_index, 0, 0)

	matrix_set(matrix_world, matrix_build_identity())

	shader_reset()

	#endregion

	#region movement

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

	//else if (keyboard_check(ord("S")) == true)
	//{
	//	var camX = obj_camera.camX
	//	var camY = obj_camera.camY

	//	playerSpeedX = abs(x - camX)
	//	playerSpeedY = abs(y - camY)

	//	if (playerSpeedX > playerSpeedY)
	//	{
	//		playerSpeedY = playerSpeedY/playerSpeedX
	//		playerSpeedX = 1

	//	}
	//	else
	//	{
	//		playerSpeedX = playerSpeedX/playerSpeedY
	//		playerSpeedY = 1
	//	}

	//	if (x > camX)
	//	{
	//		playerSpeedX *= -1
	//	}
	//	if (y > camY)
	//	{
	//		playerSpeedY *= -1
	//	}
	//}

	x += playerSpeedX * playerSpeedMultiplier
	y += playerSpeedY * playerSpeedMultiplier

	#endregion

	#endregion
}