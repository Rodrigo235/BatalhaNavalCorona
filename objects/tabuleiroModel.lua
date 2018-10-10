local mapa = {}
local navio = require "objects.naviosModel"

function mapa:getMapa()
	local tabuleiroCriado = {
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{}
	}

	for i = 1, 10 do
	
		for j = 1, 10 do

			tabuleiroCriado[i][j] = 0

		end
	end

	return tabuleiroCriado

end

function mapa:podeInserir(argMapa, argLinha, argColuna, argNavio, argOrientacao)
	if(argNavio.tamanho == 0) then 
		print("Navio ja adicionado")
		return false 
	end

	if (argNavio.orientacao[argOrientacao] == "vertical") then

		for i = 0, argNavio.tamanho - 1 do
			if (argMapa[argLinha + i][argColuna] ~= 0) then
				print("Colisao com outro navio")
				return false
			end
		end
	elseif (argNavio.orientacao[argOrientacao] == "horizontal") then

		for i = 0, argNavio.tamanho - 1 do
			if(argMapa[argLinha][argColuna + i] ~= 0) then
				print("Colisao com outro navio")
				return false
			end
		end
	end

	return true

end

------------------------------posiciona o Navio no mapa--------------------------------

function mapa:inserirNavio(argJogador, argLinha, argColuna, argNavio, argOrientacao)
	local mapa = argJogador.mapa
	
	if (argNavio.orientacao[argOrientacao] == "vertical") then

		for i = 0, argNavio.tamanho - 1 do
			mapa[argLinha + i][argColuna] = argNavio.tamanho
		end

	elseif (argNavio.orientacao[argOrientacao] == "horizontal") then

		for i = 0, argNavio.tamanho - 1 do
			mapa[argLinha][argColuna + i] = argNavio.tamanho
		end
	end

	argNavio.tamanho = 0

	return mapa

end

return mapa