// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_grid(){
	
	var lineWidth = 2
	
	draw_set_color(c_green)
	
	for (i = 320; i < room_width; i += 320)
	{
		draw_line_width(i, 0, i, room_height, lineWidth)
	}
	
	for (i = 192; i < room_height; i += 192)
	{
		draw_line_width(0, i, room_width, i, lineWidth)
	}
}