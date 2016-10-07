minetest.register_node("decor:torch", {
	description = "Torch",
	drawtype = "nodebox",
	tiles = {"decor_torch.png"},
	node_box = {
	type = "fixed",
	fixed = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
	},
	inventory_image = "decor_torch.png",
	wield_image = "decor_torch.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = 22,
	groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1, floodable = 1},
	legacy_wallmounted = true,
})