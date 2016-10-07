minetest.register_node("plants:grass", {
	description = "Grass",
	drawtype = "plantlike",
	waving = 8,
	visual_scale = 0.9,
	tiles = {"plants_grass.png"},
	inventory_image = "plants_grass.png",
	wield_image = "plants_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})