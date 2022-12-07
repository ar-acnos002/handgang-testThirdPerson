// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_grid(){
	
	var gridX = 640
	var gridY = 384
	
	var lineWidth = 2
	
	draw_set_color(c_green)
	
	for (i = gridX; i < room_width; i += gridX)
	{
		draw_line_width(i, 0, i, room_height, lineWidth)
	}
	
	for (i = gridY; i < room_height; i += gridY)
	{
		draw_line_width(0, i, room_width, i, lineWidth)
	}
}