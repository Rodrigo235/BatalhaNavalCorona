local texto = {}

function texto:newTexto(nome, mensagem, x, y, tamanhoFont)
	texto.id = nome 
	texto.texto = display.newText(mensagem, x, y, native.systemFontBold, tamanhoFont)
end

function texto:setTexto(nome, mensagem)
	local var = texto:findByName(nome)
	var.text = mensagem
end

function texto:findByName(nome)
	for k,v in pairs(texto) do
		if (v == nome) then
			return v
		end
	end
end

return texto