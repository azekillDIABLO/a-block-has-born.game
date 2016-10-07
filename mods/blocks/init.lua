--gaz
--...for now

--liquids

minetest.register_node("blocks:water", {
	description = "Water Block",
	drawtype = "liquid",
	tiles = {"blocks_water.png"},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1.5,
	liquidtype = "source",
	liquid_alternative_flowing = "blocks:water_flood",
	liquid_alternative_source = "blocks:water",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,falling_node = 1},
	})
	
minetest.register_node("blocks:water_flood", {
	description = "Water",
	groups = {crumbly = 3, falling_node = 1},
	tiles = {"blocks_water.png"},
		special_tiles = {
		{
			name = "blocks_water.png",
			backface_culling = false,
			},
		},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	liquid_renewable = false,
	drop = "",
	drowning = 0.5,
	liquidtype = "flowing",
	drawtype = "flowingliquid",
	liquid_alternative_flowing = "blocks:water_flood",
	liquid_alternative_source = "blocks:water",
	groups = {water = 3, liquid = 3, puts_out_fire = 1,falling_node = 1},
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:lava", {
	description = "Lava",
	drawtype = "liquid",
	tiles = {"blocks_lava.png"},
	light_source = 20,
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 10,
	liquidtype = "source",
	liquid_alternative_flowing = "blocks:lava_flood",
	liquid_alternative_source = "blocks:lava",
	liquid_viscosity = 9,
	damage_per_second = 17,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {lava = 3, liquid = 3, igniter = 1,falling_node = 1},
	})

minetest.register_node("blocks:lava_flood", {
	description = "Lava",
	tiles = {"blocks_lava.png"},
		special_tiles = {
		{
			name = "blocks_lava.png",
			backface_culling = false,
			},
		},
	light_source = 20,
	buildable_to = true,
	drawtype = "flowingliquid",
	paramtype = "light",
	liquid_renewable = false,
	walkable = false,
	pointable = false,
	diggable = false,
	is_ground_content = false,
	drop = "",
	drowning = 5,
	liquidtype = "flowing",
	liquid_viscosity = 9,
	damage_per_second = 20,
	liquid_alternative_flowing = "blocks:lava_flood",
	liquid_alternative_source = "blocks:lava",
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {lava = 3, liquid = 3, igniter = 1,falling_node = 1},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})

minetest.register_node("blocks:acid", {
	description = "Caustic Acid",
	drawtype = "liquid",
	tiles = {"blocks_acid.png"},
	light_source = 12,
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 100,
	liquidtype = "source",
	liquid_alternative_flowing = "blocks:acid_flood",
	liquid_alternative_source = "blocks:acid",
	liquid_viscosity = 100,
	damage_per_second = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {acid = 3, liquid = 3, falling_node = 1},
	})

	minetest.register_node("blocks:acid_flood", {
	description = "Caustic Acid",
	tiles = {"blocks_acid.png"},
		special_tiles = {
		{
			name = "blocks_acid.png",
			backface_culling = false,
			},
		},
	light_source = 14,
	buildable_to = true,
	drawtype = "flowingliquid",
	alpha = 160,
	paramtype = "light",
	liquid_renewable = false,
	walkable = false,
	pointable = false,
	diggable = false,
	is_ground_content = false,
	drop = "",
	drowning = 100,
	liquidtype = "flowing",
	liquid_viscosity = 100,
	damage_per_second = 1,
	liquid_alternative_flowing = "blocks:acid_flood",
	liquid_alternative_source = "blocks:acid",
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {acid = 3, liquid = 3, igniter = 1,falling_node = 1},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
--natural blocks

minetest.register_node("blocks:grass", {
	description = "Grass Block",
	tiles = {"blocks_grass.png"},
	groups = {crumbly = 3, soil = 1, dirt = 1, oddly_breakable_by_hand = 1},
	drop = 'blocks:dirt',
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})

minetest.register_node("blocks:dirt", {
	description = "Dirt",
	tiles = {"blocks_dirt.png"},
	groups = {crumbly = 3, soil = 1, oddly_breakable_by_hand = 1},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:rock", {
	description = "Rock",
	tiles = {"blocks_rock.png"},
	groups = {cracky = 1},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:sand", {
	description = "Sand",
	tiles = {"blocks_sand.png"},
	groups = {crumbly = 1, falling_node = 1, sand = 1, oddly_breakable_by_hand = 1},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:gravel", {
	description = "Gravel",
	tiles = {"blocks_gravel.png"},
	groups = {crumbly = 1, falling_node = 1, oddly_breakable_by_hand = 3},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:snow", {
	description = "Snow",
	tiles = {"blocks_snow.png"},
	groups = {oddly_breakable_by_hand = 2, crumbly = 3, falling_node = 1},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:snow_layer", {
	description = "Snow Layer",
	tiles = {"blocks_snow.png"},
	paramtype = "light",
	groups = {oddly_breakable_by_hand = 2, crumbly = 3, falling_node = 1},
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.15, 0.5},
		},
	},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:ice", {
	description = "Ice",
	tiles = {"blocks_ice.png"},
	groups = {crumbly = 3},
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})	
	
--rocky ores
	
minetest.register_node("blocks:iron_ore", {
	description = "Iron Ore",
	tiles = {"blocks_rock.png^blocks_iron_ore.png"},
	groups = {cracky = 3},
	drop = 'item:iron',
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
minetest.register_node("blocks:cobalt_ore", {
	description = "Cobalt Ore",
	tiles = {"blocks_rock.png^blocks_cobalt_ore.png"},
	groups = {cracky = 4},
	drop = 'item:cobalt',
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})

minetest.register_node("blocks:titanium_ore", {
	description = "Titanium Ore",
	tiles = {"blocks_rock.png^blocks_titanium_ore.png"},
	groups = {cracky = 5},
	drop = 'item:titanium',
	--sounds = default.node_sound_dirt_defaults({
	--	footstep = {name = "default_grass_footstep", gain = 0.25},
	})
	
