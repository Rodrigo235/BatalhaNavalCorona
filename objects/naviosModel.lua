local Navios = {}

function Navios:newNavios()

	local navios = {
		Submarino = {id = 1, tamanho = 1, rgb = {0.5, 0, 1}},
		Rebocador = {id = 2, tamanho = 2, rgb = {1, 0, 0}},
		Contratorpedo = {id = 3, tamanho = 3, rgb = {0, 1, 0}},
		Cruzador = {id = 4, tamanho = 4, rgb = {0, 0, 1}},
		PortaAvioes = {id = 5, tamanho = 5, rgb = {1, 1, 0}}
	}

	return navios

end

function Navios:findById(id)
	for k,v in pairs(Navios:newNavios()) do
		if (v.id == id) then
			return k, v
		end
	end
end

return Navios