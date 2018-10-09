local N = {}

function N:gerarNavios()

	local navios = {
		Rebocador = {id = 1, tamanho = 2, orientacao = {"vertical", "horizontal"}},
		Contratorpedo = {id = 2, tamanho = 3, orientacao = {"vertical", "horizontal"}},
		Cruzador = {id = 3, tamanho = 4, orientacao = {"vertical", "horizontal"}},
		PortaAvioes = {id = 4, tamanho = 5, orientacao = {"vertical", "horizontal"}}
	}

	return navios

end

function N:podeInserir(argMapa, argLinha, argColuna, argNavio, argOrientacao)
	if(argNavio.tamanho == 0) then 
		return false, "Navio ja adicionado"
	end

	if (argNavio.orientacao[argOrientacao] == "vertical") then

		for i = 0, argNavio.tamanho - 1 do
			if (argMapa[argLinha + i][argColuna] ~= 0) then
				return false, "Colisao com outro navio"
			end
		end
	elseif (argNavio.orientacao[argOrientacao] == "horizontal") then

		for i = 0, argNavio.tamanho - 1 do
			if(argMapa[argLinha][argColuna + i] ~= 0) then
				return false, "Colisao com outro navio"
			end
		end
	end

	return true

end



return N