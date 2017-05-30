--[[
	Mod Tintas_Reais para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inicializador de scripts
  ]]

-- Notificador de Inicializador
local notificar = function(msg)
	if minetest.setting_get("log_mods") then
		minetest.debug("[TINTAS_REAIS]"..msg)
	end
end

local modpath = minetest.get_modpath("tintas_reais")

-- Carregar scripts
notificar("Carregando...")

-- Trocar receitas
dofile(modpath.."/receitas.lua")
dofile(modpath.."/texturas.lua")

notificar("OK")
