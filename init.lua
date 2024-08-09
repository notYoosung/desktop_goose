local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)



mcl_mobs.register_mob(modname .. ":goose", {
	description = S("Desktop Goose"),
	type = "animal",
	spawn_class = "passive",

	hp_min = 4,
	hp_max = 4,
	xp_min = 1,
	xp_max = 3,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.69, 0.2},
	runaway = true,
	floats = 1,
	head_swivel = "head.control",
	bone_eye_height = 4,
	head_eye_height = 1.5,
	horizontal_head_height = -.3,
	curiosity = 10,
	head_yaw="z",
	visual_size = {x=1,y=1},
	visual = "mesh",
	mesh = "mobs_mc_chicken.b3d",
	textures = {
		{"mobs_mc_goose.png"},
	},

	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	follow_velocity = 1.5,
	jump_height = 1.5,
	drops = {
		-- {name = "mcl_mobitems:chicken",
		-- chance = 1,
		-- min = 1,
		-- max = 1,
		-- looting = "common",},
		-- {name = "mcl_mobitems:feather",
		-- chance = 1,
		-- min = 0,
		-- max = 2,
		-- looting = "common",},
	},
	fall_damage = 0,
	fall_speed = -2.25,
	sounds = {
		random = "goose_honk",
		damage = "goose_honk",
		death = "goose_honk",
		eat = "goose_honk",
		distance = 16,
	},
	sounds_child = {
		random = "goose_honk",
		damage = "goose_honk",
		death = "goose_honk",
		eat = "goose_honk",
		distance = 16,
	},
	animation = {
		stand_start = 0, stand_end = 0,
		walk_start = 0, walk_end = 20, walk_speed = 40,
		run_start = 0, run_end = 20, run_speed = 50,
	},
	_child_animations = {
		stand_start = 31, stand_end = 31,
		walk_start = 31, walk_end = 51, walk_speed = 80,
		run_start = 31, run_end = 51, run_speed = 80,
	},
	follow = {
		"mcl_farming:wheat_seeds",
		"mcl_farming:melon_seeds",
		"mcl_farming:pumpkin_seeds",
		"mcl_farming:beetroot_seeds",
	},
	view_range = 16,
	fear_height = 4,

	on_rightclick = function(self, clicker)
		if self:feed_tame(clicker, 1, true, false) then return end
	end,

	do_custom = function(self, dtime)
		local players = minetest.get_connected_players()
		local pos = self.object:get_pos()
		
		for k, v in ipairs(players) do
			-- if minetest.line_of_sight
			-- local lookvec = minetest.
			v:set_look_horizontal(v:get_look_horizontal()+0.1)
		end
		-- self.egg_timer = (self.egg_timer or math.random(300, 600)) - dtime
		-- if self.egg_timer > 0 then
		-- 	return
		-- end
		-- self.egg_timer = nil

		-- local pos = self.object:get_pos()

		-- minetest.add_item(pos, "mcl_throwing:egg")

		-- minetest.sound_play("mobs_mc_chicken_lay_egg", {
		-- 	pos = pos,
		-- 	gain = 1.0,
		-- 	max_hear_distance = 16,
		-- }, true)
	end,

})





-- spawn eggs
mcl_mobs.register_egg(modname .. ":goose", S("Desktop Goose"), "#a1a1a1", "#ff0000", 0)





minetest.register_chatcommand("getpos", {
	params = "[player_name]",
	description = "get the pos of a player or yourself",
	privs = { getpos },
	func = function(caller, param)
		param = param:trim()
		local name = (param ~= "" and param or caller)
		if not core.player_exists(name) then
			return false, S("Player @1 does not exist.", name)
		end
		minetest.chat_send_player(caller, "Position of " .. name .. " is: " .. tostring(minetest.get_player_by_name(name):get_pos()))
		-- return true, minetest.(name)
	end,
})