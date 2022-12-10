/// @description Insert description here
// You can write your code in this editor

z = depth
depth = 0

randomize()
var posIndex = irandom_range(1, obj_world_builder.l)

x = obj_world_builder.waterTileList[0][posIndex]
y = obj_world_builder.waterTileList[1][posIndex]

sprite_index = spr_player_boat

playerSpeedX = 0
playerSpeedY = 0
//playerSpeedMultiplier = sprite_width/48
playerSpeedMultiplier = 5