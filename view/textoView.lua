local navio = require "objects.naviosModel"

local texto = {}
local id = 1

local listaNavios = navio:newNavios()

function texto:newTexto(nome, mensagem, x, y, tamanhoFont, cor)
	if cor == nil then cor = {1, 1, 1} end

	if (nome == "navio") then
		for k,v in pairs(listaNavios) do
			if(v.id == id) then
				mensagem = k
				cor = {v.rgb[1], v.rgb[2], v.rgb[3]}
			end
		end
		id = id + 1
	end
	table.insert(texto, {id = nome, texto = display.newText(mensagem, x, y, native.systemFontBold, tamanhoFont):setFillColor(cor[1], cor[2], cor[3])})
end

function texto:setTexto(nome, mensagem)
	local var = texto:findByName(nome)
	var.texto.text = mensagem
end

function texto:findByName(nome)
	for k,v in pairs(texto) do
		if (v.id == nome) then
			return v
		end
	end
end

function texto:listName()
	local names = {}
	for k,v in pairs(texto) do
		if(tonumber(k) ~= nil and tonumber(k) <= #self) then
			names[k] = v.id
		end
	end
	return names
end

return texto