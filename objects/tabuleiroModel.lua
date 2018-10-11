local navio = require "objects.naviosModel"


local mapa = {}

function mapa:newMapa(preenchimento)
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

			tabuleiroCriado[i][j] = preenchimento

		end
	end

	return tabuleiroCriado

end

function mapa:podeInserir(argMapa, argLinha, argColuna, argNavio, argOrientacao)
	-- if(argNavio.tamanho == 0) then 
	-- 	print("Navio ja adicionado")
	-- 	return false 
	-- end

	if (argNavio.orientacao[argOrientacao] == "vertical") then

		for i = 0, argNavio.tamanho - 1 do
			if (argMapa[argLinha + i][argColuna] ~= 0) then
				print("Colisao com outro navio")
				return false, "Colisao com outro navio"
			end
		end
	elseif (argNavio.orientacao[argOrientacao] == "horizontal") then

		for i = 0, argNavio.tamanho - 1 do
			if(argMapa[argLinha][argColuna + i] ~= 0) then
				print()
				return false, "Colisao com outro navio"
			end
		end
	end

	return true

end

------------------------------posiciona o Navio no mapa--------------------------------

function mapa:inserirNavio(argJogador, argLinha, argColuna, argNavio, argOrientacao)
	local mapa = argJogador.mapa

	local podeInserir, erro = mapa:podeInserir(mapa, argLinha, argColuna, argNavio, argOrientacao)
	
	--if (argNavio.orientacao[argOrientacao] == "vertical") then
	if (podeInserir == true) then

		for i = 0, argNavio.tamanho - 1 do
			mapa[argLinha + argOrientacao.linha][argColuna + argOrientacao.coluna] = argNavio.id
		end

		return mapa

	else
		return erro

	end

	-- elseif (argNavio.orientacao[argOrientacao] == "horizontal") then

	-- 	for i = 0, argNavio.tamanho - 1 do
	-- 		mapa[argLinha][argColuna + i] = argNavio.tamanho
	-- 	end
	-- end

	-- argNavio.tamanho = 0

end

function mapa:checarJogada(clique1, clique2)
	local orientacao = {linha = clique2.linha - clique1.linha, coluna = clique2.coluna - clique1.coluna}

	if (orientacao.linha ~= 0 and orientacao.coluna ~= 0) then 
		return nil 
	else 
		if (orientacao.linha > 0) then
			orientacao.linha = 1
		elseif (orientacao.linha < 0) then
			orientacao.linha = -1
		end
		if (orientacao.coluna > 0) then
			orientacao.coluna = 1
		elseif (orientacao.coluna < 0) then
			orientacao.coluna = -1
		end
		
	end
	
	return orientacao
end

return mapa