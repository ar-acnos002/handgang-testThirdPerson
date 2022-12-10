/// @description Insert description here
// You can write your code in this editor

if (obj_camera.viewMiniMap)
{
	sprite_index = spr_minimap_player
	draw_sprite(sprite_index, image_index, x, y)
}
else
{
	#region regular processing

	#region drawing sprite billboarded

	shader_set(shader_billboarding)

	var transMat = matrix_build(x, y, z, 0, 0, 0, 1, 1, 1)

	matrix_set(matrix_world, transMat)

	//sprite_index = spr_1P
	sprite_index = spr_player_boat
	draw_sprite(sprite_index, image_index, 0, 0)

	matrix_set(matrix_world, matrix_build_identity())

	shader_reset()

	#endregion

	#region movement
	
	if (keyboard_check(ord("W")) == true)
	{
		var cameraAngle = obj_camera.cameraAngle
		
		var playerDirection = cameraAngle + 180
		
		playerSpeedX = playerSpeedMultiplier*dcos(playerDirection)
		playerSpeedY = -1*playerSpeedMultiplier*dsin(playerDirection)
		
		x += playerSpeedX
		y += playerSpeedY
	}
	
	//if (keyboard_check(ord("S")) == true)
	//{
	//	var cameraAngle = obj_camera.cameraAngle
		
	//	var playerDirection = cameraAngle
		
	//	playerSpeedX = playerSpeedMultiplier*dcos(playerDirection)
	//	playerSpeedY = -1*playerSpeedMultiplier*dsin(playerDirection)
		
	//	x += playerSpeedX
	//	y += playerSpeedY
	//}

	#endregion

	#endregion
}

#region check collision

if (tilemap_get_at_pixel(obj_world_builder.landMap, x+playerSpeedX, y+playerSpeedY) != 0)
{
	x = round(x)
	y = round(y)
	
	while (tilemap_get_at_pixel(obj_world_builder.landMap, x, y) == 0)
	{
		x += playerSpeedX
		y += playerSpeedY
	}
	
	while (tilemap_get_at_pixel(obj_world_builder.landMap, x, y) != 0)
	{
		x -= playerSpeedX
		y -= playerSpeedY
	}
}

#endregion