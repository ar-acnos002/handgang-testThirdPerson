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
	
	if (keyboard_check(ord("A")) == true)
	{
		var newCameraAngle = playerDirection + 1*playerLookSensitivity
		
		playerDirection = newCameraAngle
	}

	if (keyboard_check(ord("D")) == true)
	{
		var newCameraAngle = playerDirection - 1*playerLookSensitivity
		
		playerDirection = newCameraAngle
	}

	#endregion
	
	#region check collision
	
	var edgeAngle = 90
	var originX = x + (sprite_width/2)*dcos(playerDirection)
	var originY = y - (sprite_width/2)*dsin(playerDirection)

	var collisionFrontX = x + sprite_width*dcos(playerDirection)
	var collisionFrontY = y - sprite_width*dsin(playerDirection)
	
	var collisionLeftX = originX + (sprite_width/2)*dcos(playerDirection+edgeAngle)
	var collisionLeftY = originY - (sprite_width/2)*dsin(playerDirection+edgeAngle)
	
	var collisionRightX = originX + (sprite_width/2)*dcos(playerDirection-edgeAngle)
	var collisionRightY = originY - (sprite_width/2)*dsin(playerDirection-edgeAngle)
	
	var collisionBackX = x + 1*dcos(playerDirection+180)
	var collisionBackY = y - 1*dsin(playerDirection+180)

	if (tilemap_get_at_pixel(obj_world_builder.landMap, collisionFrontX, collisionFrontY) != 0)
	{
		while (tilemap_get_at_pixel(obj_world_builder.landMap, collisionFrontX, collisionFrontY) != 0)
		{
			var pushBackX = 1*dcos(playerDirection+180)
			var pushBackY = -1*dsin(playerDirection+180)
			
			x += pushBackX
			y += pushBackY
			
			collisionFrontX = x + sprite_width*dcos(playerDirection)
			collisionFrontY = y - sprite_width*dsin(playerDirection)
		}
		playerSpeedX = 0
		playerSpeedY = 0
	}
	
	if (tilemap_get_at_pixel(obj_world_builder.landMap, collisionLeftX, collisionLeftY) != 0)
	{
		while (tilemap_get_at_pixel(obj_world_builder.landMap, collisionLeftX, collisionLeftY) != 0)
		{
			playerDirection -= playerLookSensitivity
			var pushBackX = 1*dcos(playerDirection-90)
			var pushBackY = -1*dsin(playerDirection-90)
			
			x += pushBackX
			y += pushBackY
			
			var originX = x + (sprite_width/2)*dcos(playerDirection)
			var originY = y - (sprite_width/2)*dsin(playerDirection)
			var collisionLeftX = originX + (sprite_width/2)*dcos(playerDirection+edgeAngle)
			var collisionLeftY = originY - (sprite_width/2)*dsin(playerDirection+edgeAngle)
		}
		playerSpeedX = 0
		playerSpeedY = 0
	}
	
	if (tilemap_get_at_pixel(obj_world_builder.landMap, collisionRightX, collisionRightY) != 0)
	{
		while (tilemap_get_at_pixel(obj_world_builder.landMap, collisionRightX, collisionRightY) != 0)
		{
			playerDirection += playerLookSensitivity
			var pushBackX = 1*dcos(playerDirection+90)
			var pushBackY = -1*dsin(playerDirection+90)
			
			x += pushBackX
			y += pushBackY
			
			var originX = x + (sprite_width/2)*dcos(playerDirection)
			var originY = y - (sprite_width/2)*dsin(playerDirection)
			var collisionRightX = originX + (sprite_width/2)*dcos(playerDirection-edgeAngle)
			var collisionRightY = originY - (sprite_width/2)*dsin(playerDirection-edgeAngle)
		}
		playerSpeedX = 0
		playerSpeedY = 0
	}
	
	if (tilemap_get_at_pixel(obj_world_builder.landMap, collisionBackX, collisionBackY) != 0)
	{
		while (tilemap_get_at_pixel(obj_world_builder.landMap, collisionBackX, collisionBackY) != 0)
		{
			var pushBackX = 1*dcos(playerDirection)
			var pushBackY = -1*dsin(playerDirection)
			
			x += pushBackX
			y += pushBackY
			
			var collisionBackX = x + 1*dcos(playerDirection+180)
			var collisionBackY = y - 1*dsin(playerDirection+180)
		}
		playerSpeedX = 0
		playerSpeedY = 0
	}

	#endregion

	#endregion
}