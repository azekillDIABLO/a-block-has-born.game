--= Ambience lite by TenPlus1 (2nd March 2015)
--= modified by kilbith (2015)

local max_frequency_all = 1000 -- larger number means more frequent sounds (10-1000)
local SOUNDVOLUME = 1
local volume = 0.3
local ambiences
local played_on_start = false
local tempy = {}

-- sound sets
local night = {
	handler = {},			frequency = 40,
	{name="hornedowl",		length=2.5},
	{name="cricket",		length=6}
}
local day = {
	handler = {},			frequency = 40,
	{name="robin",			length=4.5},
	{name="bird1",			length=11.5},
	{name="bird2",			length=6.5}
}
local air_high = {
	handler = {},			frequency = 20,
	{name="craw",			length=3.5}
}
local cave = {
	handler = {},			frequency = 60,
	{name="drippingwater1",		length=1.5},
	{name="drippingwater2",		length=1.5}
}
local beach = {
	handler = {},			frequency = 80,
	{name="seagull",		length=4.5},
	{name="wind",			length=9.5}
}
local desert = {
	handler = {},			frequency = 20,
	{name="desertwind",		length=8.5}
}
local flowing_water = {
	handler = {},			frequency = 1000,
	{name="waterfall",		length=6}
}
local underwater = {
	handler = {},			frequency = 1000,
	{name="scuba",			length=8}
}
local splash = {
	handler = {},			frequency = 1000,
	{name="swim_splashing",		length=3}
}
local lava = {
	handler = {},			frequency = 1000,
	{name="lava",			length=7}
}

-- check where player is and which sounds are played
local get_ambience = function(player)

	-- where am I?
	local pos = player:getpos()

	-- what is around me?
	pos.y = pos.y + 1.4 -- head level
	local nod_head = minetest.get_node(pos).name

	pos.y = pos.y - 1.2 -- feet level
	local nod_feet = minetest.get_node(pos).name

	pos.y = pos.y - 0.2 -- reset pos

	-- START Ambiance

	if nod_head == "blocks:water" or nod_head == "blocks:water_flood" then
		return {underwater=underwater}
	end

	if nod_feet == "blocks:water" or nod_feet == "blocks:water_flood" then
		return {splash=splash}
	end

	-- this may seem messy but is faster than checking each area separately for specific nodes
	local num_lava, num_water_source, num_water_flowing, num_desert = 0,0,0,0

	-- get block of nodes we need to check
	tempy = minetest.find_nodes_in_area({x=pos.x-6,y=pos.y-2, z=pos.z-6}, {x=pos.x+6,y=pos.y+2, z=pos.z+6},
		{"blocks:lava_flood", "blocks:lava", "blocks:water_flood", "blocks:water", 
		"blocks:sand", "blocks:stone",})

	-- count separate instances in block
	for _, npos in ipairs(tempy) do
		local node = minetest.get_node(npos).name
		if node == "blocks:lava_flood" or node == "blocks:lava" then num_lava = num_lava + 1 end
		if node == "blocks:water_flood" then num_water_flowing = num_water_flowing + 1 end
		if node == "blocks:water" then num_water_source = num_water_source + 1 end
		if node == "blocks:sand" or node == "blocks:stone" then num_desert = num_desert + 1 end
	end ; --print (num_fire, num_lava, num_water_flowing, num_water_source, num_desert)

	if num_lava > 5 then
		return {lava=lava}		
	end

	if num_water_flowing > 30 then
		return {flowing_water=flowing_water}
	end

	if pos.y < 7 and pos.y > 0 and num_water_source > 100 then
		return {beach=beach}
	end

	if num_desert > 150 then
		return {desert=desert}
	end

	if pos.y < -10 then
		return {cave=cave}
	end
	
	if pos.y > 60 then
		return {air_high=air_high}
	end

	if minetest.get_timeofday() > 0.2 and minetest.get_timeofday() < 0.8 then
		return {day=day}
	else
		return {night=night}
	end

	-- END Ambiance
end

-- play sound, set handler then delete handler when sound finished
local play_sound = function(player, list, number)

	local player_name = player:get_player_name()

	if list.handler[player_name] == nil then

		local gain = volume * SOUNDVOLUME
		local handler = minetest.sound_play(list[number].name, {to_player=player_name, gain=gain})

		if handler then
			list.handler[player_name] = handler

			minetest.after(list[number].length, function(args)
				local list = args[1]
				local player_name = args[2]

				if list.handler[player_name] then
					minetest.sound_stop(list.handler[player_name])
					list.handler[player_name] = nil
				end
			end, {list, player_name})
		end

	end
end

-- stop sound in still_playing
local stop_sound = function (list, player)

	local player_name = player:get_player_name()

	if list.handler[player_name] then
		if list.on_stop then
			minetest.sound_play(list.on_stop, {to_player=player:get_player_name(),gain=SOUNDVOLUME})
		end
		minetest.sound_stop(list.handler[player_name])
		list.handler[player_name] = nil
	end

end

-- check sounds that are not in still_playing
local still_playing = function(still_playing, player)
	if not still_playing.air_high then			stop_sound(air_high, player) end
	if not still_playing.cave then				stop_sound(cave, player) end
	if not still_playing.beach then				stop_sound(beach, player) end
	if not still_playing.desert then			stop_sound(desert, player) end
	if not still_playing.night then				stop_sound(night, player) end
	if not still_playing.day then				stop_sound(day, player) end
	if not still_playing.flowing_water then			stop_sound(flowing_water, player) end
	if not still_playing.splash then			stop_sound(splash, player) end
	if not still_playing.underwater then			stop_sound(underwater, player) end
	if not still_playing.lava then				stop_sound(lava, player) end	
end

-- player routine
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime

	-- every 1 second
	if timer < 1 then return end
	timer = 0

	for _,player in ipairs(minetest.get_connected_players()) do
--local t1 = os.clock()
		ambiences = get_ambience(player)
--print ("[AMBIENCE] "..math.ceil((os.clock() - t1) * 1000).." ms")
		still_playing(ambiences, player)

		for _,ambience in pairs(ambiences) do

			if math.random(1, 1000) <= ambience.frequency then			
				if ambience.on_start and played_on_start == false then
					played_on_start = true
					minetest.sound_play(ambience.on_start,
					{to_player=player:get_player_name(),gain=SOUNDVOLUME})					
				end
				play_sound(player, ambience, math.random(1, #ambience))
			end
		end

	end
end)

-- set volume command
minetest.register_chatcommand("svol", {
	params = "<svol>",
	description = "set sound volume (0.1 to 1.0)",
	privs = {server=true},
	func = function(name, param)
		SOUNDVOLUME = param
		minetest.chat_send_player(name, "Sound volume set.")
	end,
})
