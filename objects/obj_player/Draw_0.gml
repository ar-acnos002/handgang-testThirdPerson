/// @description Insert description here
// You can write your code in this editor

var cameraAngle = obj_camera.cameraAngle
var playerDirection = cameraAngle + 180

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
	
	sprite_index = spr_player_boat
	draw_sprite(sprite_index, image_index, 0, 0)

	matrix_set(matrix_world, matrix_build_identity())

	shader_reset()

	#endregion

	#region movement
	
	if (keyboard_check(ord("W")) == true)
	{
		playerSpeedX = playerSpeedMultiplier*dcos(playerDirection)
		playerSpeedY = -1*playerSpeedMultiplier*dsin(playerDirection)
		
		x += playerSpeedX
		y += playerSpeedY
	}
	
	if (keyboard_check(ord("S")) == true)
	{
		playerSpeedX = playerSpeedMultiplier*dcos(playerDirection+180)
		playerSpeedY = -1*playerSpeedMultiplier*dsin(playerDirection+180)
		
		x += playerSpeedX
		y += playerSpeedY
	}

	#endregion
	
	#region check collision

	var collisionFrontX = x + sprite_width*dcos(playerDirection)
	var collisionFrontY = y - sprite_width*dsin(playerDirection)

	if (tilemap_get_at_pixel(obj_world_builder.landMap, collisionFrontX, collisionFrontY) != 0)
	{
		while (tilemap_get_at_pixel(obj_world_builder.landMap, collisionFrontX, collisionFrontY) != 0)
		{
			x -= playerSpeedX
			y -= playerSpeedY
			collisionFrontX = x + sprite_width*dcos(playerDirection)
			collisionFrontY = y - sprite_width*dsin(playerDirection)
		}
		
		while (tilemap_get_at_pixel(obj_world_builder.landMap, collisionFrontX, collisionFrontY) == 0)
		{
			x += playerSpeedX
			y += playerSpeedY
			collisionFrontX = x + sprite_width*dcos(playerDirection)
			collisionFrontY = y - sprite_width*dsin(playerDirection)
		}
	}

	#endregion

	#endregion
}