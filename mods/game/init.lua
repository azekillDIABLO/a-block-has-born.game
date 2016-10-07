game = {}

game_path = minetest.get_modpath( "game");

dofile(game_path.."/player.lua")

game.LIGHT_MAX = 22

-- GUI related stuff
--game.gui_bg = "bgcolor[#888808BB;true]" don't use :P
game.gui_bg_img = "background[0;0;inventory.png;true]"
--game.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"   unused for now...


function game.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;inventory.png]"
	end
	return out
end

game.gui_survival_form =
			"size[8,5.5]"..
			--"image[6,0.6;1,2;player.png]"..
			"list[current_player;main;0,0;8,2;]"..
			"list[current_player;craft;0,2.5;3,3;]"..
			"list[current_player;craftpreview;3,3.5;1,1;]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			"listring[current_player;main]"
minetest.register_on_joinplayer(function(player)
player:set_inventory_formspec(game.gui_survival_form)
player:hud_set_hotbar_itemcount(16)
end)
	