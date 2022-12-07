/// @description Insert description here
// You can write your code in this editor

z = depth
depth = 0

randomize()
var posIndex = irandom_range(1, obj_world_builder.l)

x = obj_world_builder.waterTileList[0][posIndex]
y = obj_world_builder.waterTileList[1][posIndex]

backsideX = x
backsideY = y

playerSpeedX = 0
playerSpeedY = 0
playerSpeedMultiplier = sprite_height/16

if (x >= room_width/2)
{
	backsideX += 1
}
else
{
	backsideX -= 1
}

if (y >= room_height/2)
{
	backsideY += 1
}
else
{
	backsideY -= 1
}