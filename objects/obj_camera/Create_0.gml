/// @description Insert description here
// You can write your code in this editor

var playerX = obj_player.x
var playerY = obj_player.y
var playerHeight = -obj_player.sprite_height

cameraAngle = obj_player.playerDirection+180

var lookDistance = obj_player.sprite_height-1
var lookHeight = obj_player.sprite_height/8

camX = playerX + (dcos(cameraAngle) + lookDistance)
camY = playerY - (dsin(cameraAngle) + lookDistance)
camZ = playerHeight - lookHeight

var camera = camera_get_active()

var camViewMat = matrix_build_lookat(camX, camY, camZ, playerX, playerY, playerHeight, 0, 0, 1)
var camProjMat = matrix_build_projection_perspective_fov(72.5, 640/384, 1, 2000)

camera_set_view_mat(camera, camViewMat)
camera_set_proj_mat(camera, camProjMat)

camera_apply(camera)

cameraRadius = point_distance(camX, camY, playerX, playerY)

viewMiniMap = false