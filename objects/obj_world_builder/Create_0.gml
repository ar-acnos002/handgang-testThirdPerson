/// @description Insert description here
// You can write your code in this editor


var waterLayer = layer_create(0, "water_only")
var landLayer = layer_create(0, "land_only")

var worldTileMap1 = layer_tilemap_create(waterLayer, 0, 0, ts_south_blue, room_width, room_height)
var worldTileMap2 = layer_tilemap_create(landLayer, 0, 0, ts_south_blue, room_width, room_height)
landMap = worldTileMap2

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
		
		if (tileChance > 75)
		{
			var tileIndex = 1
			
			tilemap_set_at_pixel(worldTileMap2, tileIndex, i, j)
		}
		else
		{
			var tempIndex = 4
			
			if (tilemap_get_at_pixel(worldTileMap2, i-1, j-1) == 1 or tilemap_get_at_pixel(worldTileMap2, i, j-1) == 1)
			{
				randomize()
				tileChance = irandom_range(1, 100)
				
				if (tileChance <= 75)
				{
					tempIndex = 1
				}
			}
			
			if (tilemap_get_at_pixel(worldTileMap1, i-1, j) == 4 or tilemap_get_at_pixel(worldTileMap1, i, j-1) == 4)
			{
				tempIndex = 4
			}
			
			tileIndex = tempIndex
			
			if (tileIndex == 4)
			{
				tilemap_set_at_pixel(worldTileMap1, tileIndex, i, j)
				
				l++
				waterTileList[0][l] = i + tileX/2
				waterTileList[1][l] = j + tileY/2
			}
			else if (tileIndex == 1)
			{
				tilemap_set_at_pixel(worldTileMap2, tileIndex, i, j)
			}
		}
		show_debug_message("Tile created successfully at index: "+string(i)+", "+string(j))
	}
}