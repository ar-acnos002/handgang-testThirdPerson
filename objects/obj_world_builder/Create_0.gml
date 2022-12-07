/// @description Insert description here
// You can write your code in this editor


var worldLayer = layer_create(0)

var worldTileMap = layer_tilemap_create(worldLayer, 0, 0, ts_south_blue, room_width, room_height)

var tileX = 200

var tileY = 120

l = 0
waterTileList[0][l] = 0
waterTileList[1][l] = 0

for (var i = 0; i < room_width; i += tileX)
{
	for (var j = 0; j < room_height; j += tileY)
	{
		randomize()
		var tileChance = irandom_range(1, 100)
		
		if (tileChance > 70)
		{
			var tileIndex = 1
			tilemap_set_at_pixel(worldTileMap, tileIndex, i, j)
		}
		else
		{
			var tempIndex = 4
			
			if (tilemap_get_at_pixel(worldTileMap, i-1, j-1) == 1 or tilemap_get_at_pixel(worldTileMap, i, j-1) == 1)
			{
				randomize()
				tileChance = irandom_range(1, 100)
				
				if (tileChance <= 70)
				{
					tempIndex = 1
				}
			}
			
			if (tilemap_get_at_pixel(worldTileMap, i-1, j) == 4 or tilemap_get_at_pixel(worldTileMap, i, j-1) == 4)
			{
				tempIndex = 4
			}
			
			tileIndex = tempIndex
			tilemap_set_at_pixel(worldTileMap, tileIndex, i, j)
			if (tileIndex == 4)
			{
				l++
				waterTileList[0][l] = i + tileX/2
				waterTileList[1][l] = j + tileY/2
			}
		}
		show_debug_message("Tile created successfully at index: "+string(i)+", "+string(j))
	}
}