/// @description Insert description here
// You can write your code in this editor

z = depth
depth = 0

backsideX = x
backsideY = y

playerSpeedX = 0
playerSpeedY = 0
playerSpeedMultiplier = 5

if (x >= 0)
{
	backsideX += 1
}
else
{
	backsideX -= 1
}

if (y >= 0)
{
	backsideY += 1
}
else
{
	backsideY -= 1
}