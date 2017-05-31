--[[
	Mod Tintas_Reais para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mudar texturas (evitando sobreposição de pacotes de texturas)
  ]]


-- Verifica se está habilitado para trocar receitas
local status = minetest.setting_getbool("macrotintas_textures")
if not (status == nil) and (status == false) then
    return
end

-- Altera todas as texturas
for _, c in ipairs(dye.dyes) do
	minetest.override_item("dye:" .. c[1], {inventory_image = "tintas_reais_" .. c[1] .. ".png"})
end

