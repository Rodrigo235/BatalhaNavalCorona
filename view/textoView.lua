local naviosModel = require "objects.naviosModel"

local texto = {}
local id = 2

local listaNavios = naviosModel:newNavios()

function texto:newTexto(nome, mensagem, x, y, tamanhoFont, cor)
	if cor == nil then cor = {1, 1, 1} end

	if (nome == "navio") then
		local keyNavio, valueNavio = naviosModel:findById(id)
		mensagem = keyNavio
		cor = {valueNavio.rgb[1], valueNavio.rgb[2], valueNavio.rgb[3]}
		id = id + 1
	end
	table.insert(texto, {id = nome, texto = display.newText(mensagem, x, y, native.systemFontBold, tamanhoFont):setFillColor(cor[1], cor[2], cor[3])})
end

function texto:setTexto(nome, mensagem)
	local var = texto:findByName(nome)

	if (nome == "navio") then
		local keyNavio, valueNavio = naviosModel:findById(id)
		mensagem = keyNavio
		var:setFillColor(valueNavio.rgb[1], valueNavio.rgb[2], valueNavio.rgb[3])
		id = id + 1
	end
	
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