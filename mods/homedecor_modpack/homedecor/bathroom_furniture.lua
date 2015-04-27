local S = homedecor.gettext

local bathroom_tile_colors = {
	{ "1", "white/grey" },
	{ "2", "white/dark grey" },
	{ "3", "white/black" },
	{ "4", "black/dark grey" },
	{ "red", "white/red" },
	{ "green", "white/green" },
	{ "blue", "white/blue" },
	{ "yellow", "white/yellow" },
	{ "tan", "white/tan" },
}

for i in ipairs(bathroom_tile_colors) do
	local color = bathroom_tile_colors[i][1]
	local shade = bathroom_tile_colors[i][2]
	minetest.register_node("homedecor:tiles_"..color, {
		description = "Bathroom/kitchen tiles ("..shade..")",
		tiles = {
			"homedecor_bathroom_tiles_"..color..".png",
			"homedecor_bathroom_tiles_"..color..".png",
			"homedecor_bathroom_tiles_"..color..".png",
			"homedecor_bathroom_tiles_"..color..".png",
			"homedecor_bathroom_tiles_"..color..".png^[transformR90",
			"homedecor_bathroom_tiles_"..color..".png^[transformR90"
		},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
	})
end

local tr_cbox = {
	type = "fixed",
	fixed = { -0.375, -0.3125, 0.25, 0.375, 0.375, 0.5 }
}

homedecor.register("towel_rod", {
	description = "Towel rod with towel",
	mesh = "homedecor_towel_rod.obj",
	tiles = {
		"homedecor_generic_terrycloth.png",
		"default_wood.png",
	},
	inventory_image = "homedecor_towel_rod_inv.png",
	selection_box = tr_cbox,
	collision_box = tr_cbox,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_defaults(),
})

homedecor.register("medicine_cabinet", {
	description = S("Medicine Cabinet"),
	tiles = {
		'homedecor_medicine_cabinet_tb.png',
		'homedecor_medicine_cabinet_tb.png',
		'homedecor_medicine_cabinet_sides.png',
		'homedecor_medicine_cabinet_sides.png',
		'homedecor_medicine_cabinet_back.png',
		'homedecor_medicine_cabinet_front.png'
	},
	inventory_image = "homedecor_medicine_cabinet_inv.png",
	selection_box = {
		type = "fixed",
		fixed = {-0.3125, -0.1875, 0.3125, 0.3125, 0.5, 0.5}
	},
	node_box = {
		type = "fixed",
		fixed = {-0.3125, -0.1875, 0.3125, 0.3125, 0.5, 0.5}
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, puncher, pointed_thing)
		node.name = "homedecor:medicine_cabinet_open"
		minetest.swap_node(pos, node)
	end,
	infotext=S("Medicine cabinet"),
	inventory = {
		size=6,
	},
})

homedecor.register("medicine_cabinet_open", {
	tiles = {
		'homedecor_medicine_cabinet_tb.png',
		'homedecor_medicine_cabinet_tb.png',
		"homedecor_medicine_cabinet_open_right.png",
		'homedecor_medicine_cabinet_sides.png',
		'homedecor_medicine_cabinet_back.png',
		"homedecor_medicine_cabinet_open_front.png"
	},
	groups = { snappy = 3, not_in_creative_inventory=1 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.1875, 0.375, 0.3125, 0.5, 0.5}, -- NodeBox1
			{0.28, -0.1875, -0.1875, 0.3125, 0.5, 0.375}, -- NodeBox2
		}
	},
	drop = "homedecor:medicine_cabinet",
	on_punch = function(pos, node, puncher, pointed_thing)
		node.name = "homedecor:medicine_cabinet"
		minetest.swap_node(pos, node)
	end,
})

