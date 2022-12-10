/// @description Insert description here
// You can write your code in this editor


drawX = 64
drawY = 64

draw_text(drawX, drawY, "Camera: "+string(obj_camera.camX)+", "+string(obj_camera.camY)+", "+string(obj_camera.camZ))

draw_text(drawX, drawY+32, "Player Speed X: "+string(obj_player.playerSpeedX))
draw_text(drawX, drawY+48, "Player Speed Y: "+string(obj_player.playerSpeedY))
draw_text(drawX, drawY+80, "Camera Radius: "+string(obj_camera.cameraRadius))
draw_text(drawX, drawY+96, "Camera Angle: "+string(obj_camera.cameraAngle))