local texto = {}

function texto:newTexto(nome, mensagem, x, y, tamanhoFont)
	table.insert(texto, {id = nome, texto = display.newText(mensagem, x, y, native.systemFontBold, tamanhoFont)})
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