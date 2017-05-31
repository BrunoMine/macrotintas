--[[
	Mod Tintas_Reais para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Troca as receitas das tintas
  ]]

-- Verifica se está habilitado para trocar receitas
local status = minetest.setting_getbool("macrotintas_crafting")
if not (status == nil) and (status == false) then
    return
end

-- Remover todas as receitas padrões
for _, c in ipairs(dye.dyes) do
	minetest.clear_craft({output = 'dye:' .. c[1]})
end

-- Receitas
minetest.register_craft({
	output = 'dye:white 10',
	recipe = {
		{'default:stone','flowers:dandelion_white','default:stone'},
		{'flowers:dandelion_white','flowers:dandelion_white','flowers:dandelion_white'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:grey',
	recipe = {
		{'default:stone','default:coal_lump','default:stone'},
		{'default:stone','default:coal_lump','default:stone'},
		{'default:paper','dye:white','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:dark_grey',
	recipe = {
		{'default:stone','default:coal_lump','default:stone'},
		{'default:stone','default:coal_lump','default:stone'},
		{'default:paper','dye:grey','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:black 10',
	recipe = {
		{'default:stone','default:coal_lump','default:stone'},
		{'default:stone','default:coal_lump','default:stone'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:violet 10',
	recipe = {
		{'default:stone','flowers:viola','default:stone'},
		{'flowers:viola','flowers:viola','flowers:viola'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:blue 10',
	recipe = {
		{'default:stone','flowers:geranium','default:stone'},
		{'flowers:geranium','flowers:geranium','flowers:geranium'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:cyan',
	recipe = {
		{'default:stone','flowers:dandelion_white','default:stone'},
		{'default:stone','default:cactus','default:stone'},
		{'default:paper','dye:blue','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:dark_green',
	recipe = {
		{'default:stone','default:coal_lump','default:stone'},
		{'default:stone','default:coal_lump','default:stone'},
		{'default:paper','dye:green','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:green 10',
	recipe = {
		{'default:stone','default:cactus','default:stone'},
		{'default:cactus','default:cactus','default:cactus'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:yellow 10',
	recipe = {
		{'default:stone','flowers:dandelion_yellow','default:stone'},
		{'flowers:dandelion_yellow','flowers:dandelion_yellow','flowers:dandelion_yellow'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:brown 3',
	recipe = {
		{'','',''},
		{'','default:stick',''},
		{'dye:orange','dye:blue','dye:orange'},
	}
})
minetest.register_craft({
	output = 'dye:orange 10',
	recipe = {
		{'default:stone','flowers:tulip','default:stone'},
		{'flowers:tulip','flowers:tulip','flowers:tulip'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:red 10',
	recipe = {
		{'default:stone','flowers:rose','default:stone'},
		{'flowers:rose','flowers:rose','flowers:rose'},
		{'default:paper','default:steel_ingot','default:paper'},
	}
})
minetest.register_craft({
	output = 'dye:pink 3',
	recipe = {
		{'','',''},
		{'','default:stick',''},
		{'dye:red','dye:white','dye:red'},
	}
})

-- Refazer receitas misturas

local mixbases = {"pink", "magenta", "red", "orange", "brown", "yellow", "green", "dark_green", "cyan", "blue", "violet", "black", "dark_grey", "grey", "white"}

local mixes = {
	--             pink,     magenta,  red,      orange,      brown,       yellow,      green,       dark_green,  cyan,   blue,    violet,  black,      dark_grey,  grey,  white
	white      = {"pink",   "pink",   "pink",   "orange",    "orange",    "yellow",    "green",     "green",     "grey", "cyan",  "violet","grey",     "grey",     "grey","white"},
	grey       = {"pink",   "pink",   "pink",   "orange",    "orange",    "yellow",    "green",     "green",     "grey", "cyan",  "violet","dark_grey","grey",     "grey"},
	dark_grey  = {"brown",  "brown",  "brown",  "brown",     "brown",     "brown",     "dark_green","dark_green","blue", "blue",  "violet","black",    "dark_grey"},
	black      = {"black",  "black",  "black",  "black",     "black",     "black",     "black",     "black",     "black","black", "black", "black"},
	violet     = {"magenta","magenta","magenta","red",       "brown",     "red",       "cyan",      "brown",     "blue", "violet","violet"},
	blue       = {"violet", "violet", "magenta","brown",     "brown",     "dark_green","cyan",      "cyan",      "cyan", "blue"},
	cyan       = {"brown",  "blue",   "brown",  "dark_green","dark_grey", "green",     "cyan",      "dark_green","cyan"},
	dark_green = {"brown",  "brown",  "brown",  "brown",     "brown",     "green",     "green",     "dark_green"},
	green      = {"yellow", "brown",  "yellow", "yellow",    "dark_green","green",     "green"},
	yellow     = {"orange", "red",    "orange", "yellow",    "orange",    "yellow"},
	brown      = {"brown",  "brown",  "brown",  "orange",    "brown"},
	orange     = {"orange", "red",    "orange", "orange"},
	red        = {"pink",   "magenta","red"},
	magenta    = {"magenta","magenta"},
	pink       = {"pink"},
}

for one, results in pairs(mixes) do
	for i, result in ipairs(results) do
		local another = mixbases[i]
		minetest.register_craft({
			type = "shapeless",
			output = 'dye:' .. result .. ' 2',
			recipe = {'dye:' .. one, 'dye:' .. another},
		})
	end
end
