-- Terrain
minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_stone", "blocks:rock")
minetest.register_alias("mapgen_dirt", "blocks:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "blocks:grass")
minetest.register_alias("mapgen_sand", "blocks:sand")
minetest.register_alias("mapgen_water_source", "blocks:water")
minetest.register_alias("mapgen_river_water_source", "blocks:water")
minetest.register_alias("mapgen_lava_source", "blocks:lava")
minetest.register_alias("mapgen_gravel", "blocks:gravel")
minetest.register_alias("mapgen_desert_stone", "blocks:rock")
minetest.register_alias("mapgen_desert_sand", "blocks:sand")
minetest.register_alias("mapgen_dirt_with_snow", "blocks:snow")
minetest.register_alias("mapgen_snowblock", "blocks:snow")
minetest.register_alias("mapgen_snow", "blocks:snow_layer")
minetest.register_alias("mapgen_ice", "blocks:ice")
minetest.register_alias("mapgen_sandstone", "blocks:sandstone")

-- Flora (mgv6)
minetest.register_alias("mapgen_tree", "blocks:tree")
minetest.register_alias("mapgen_leaves", "blocks:leaves")
minetest.register_alias("mapgen_apple", "blocks:leaves_with_apple")
minetest.register_alias("mapgen_jungletree", "blocks:jungletree")
minetest.register_alias("mapgen_jungleleaves", "blocks:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "blocks:junglegrass")
minetest.register_alias("mapgen_pine_tree", "blocks:pine_tree")
minetest.register_alias("mapgen_pine_needles", "blocks:pine_needles")

-- Dungeons
minetest.register_alias("mapgen_cobble", "blocks:cobble")
minetest.register_alias("mapgen_stair_cobble", "blocks:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "blocks:mossycobble")
minetest.register_alias("mapgen_sandstonebrick", "blocks:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstonebrick", "blocks:stair_sandstonebrick")


minetest.clear_registered_biomes()
	
	minetest.register_biome({
		name = "grassland",
		--node_dust = "",
		node_top = "blocks:grass",
		depth_top = 3,
		node_filler = "blocks:dirt",
		depth_filler = 3,
		node_stone = "blocks:rock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2,
		y_max = 310,
		heat_point = 60,
		humidity_point = 25,
	})
	
	minetest.register_biome({
		name = "sandness",
		--node_dust = "",
		node_top = "blocks:sand",
		depth_top = 5,
		node_filler = "blocks:sand",
		depth_filler = 1,
		node_stone = "blocks:rock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = 8,
		heat_point = 15,
		humidity_point = 60,
	})
	
	minetest.register_biome({
		name = "dryland",
		--node_dust = "",
		node_top = "blocks:dirt",
		depth_top = 1,
		node_filler = "blocks:dirt",
		depth_filler = 1,
		node_stone = "blocks:dirt",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = 31000,
		heat_point = 100,
		humidity_point = 5,
	})

-- Mahcaves

	minetest.register_ore({
		ore_type = "blob",
		ore = "air",
		wherein = {"blocks:rock"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 15,
		y_min = -31000,
		y_max = -24,
		noise_threshold = 0.2,
		noise_params = {
			offset = 0.7,
			scale = 0.1,
			spread = {x = 250, y = 250, z = 250},
			seed = 7566,
			octaves = 1,
			persist = 1
		},
	})
	


-- Caustic Acid

	minetest.register_ore({
		ore_type = "blob",
		ore = "blocks:acid",
		wherein = {"air"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 11,
		y_min = -31000,
		y_max = -90,
		noise_threshold = 0.4,
		noise_params = {
			offset = 0.7,
			scale = 0.1,
			spread = {x = 390, y = 390, z = 390},
			seed = 767853,
			octaves = 1,
			persist = 0
		},
	})

-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "blocks:gravel",
		wherein         = {"blocks:rock"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 18, y = 2, z = 18},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

-- Iron

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "blocks:iron_ore",
		wherein        = "blocks:rock",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 7,
		clust_size     = 8,
		y_min          = -31000,
		y_max          = 64,
	})

-- Cobalt

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "blocks:cobalt_ore",
		wherein        = "blocks:rock",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 8,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = -100,
	})	

-- Grass (herb)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"blocks:dirt_with_grass", "blocks:sand"},
		sidelen = 16,
		noise_params = {
			offset = 14,
			scale = 15,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 4
		},
		biomes = {"grassland"},
		y_min = -45,
		y_max = 31000,
		decoration = "plants:grass",
	})