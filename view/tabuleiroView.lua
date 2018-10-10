local jogadorModel = require "objects.jogadorModel"

local tabuleiroView = {}

local id = 1
local primeiroClique
local segundoClique

local jogador = jogadorModel:newJogador("Nekrols")

function tabuleiroView:newTabuleiro()

	local deslocamentoX = 0
	local deslocamentoY = display.actualContentWidth * 0.25
	local tamanhoDoQuadrado = 25

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

			tabuleiroCriado[i][j] = display.newRect(deslocamentoX + 20, deslocamentoY + 20, tamanhoDoQuadrado, tamanhoDoQuadrado)
			tabuleiroCriado[i][j]:setFillColor(0.2, 0.2, 0.2)
			tabuleiroCriado[i][j].linha = i
			tabuleiroCriado[i][j].coluna = j
			tabuleiroCriado[i][j]:addEventListener("touch", fazJogada)

			deslocamentoX = deslocamentoX + (display.actualContentWidth * 0.1)

		end
		deslocamentoY = deslocamentoY + (display.actualContentHeight * 0.048)
		deslocamentoX = 0
	end

	return tabuleiroCriado

end

function fazJogada(event)
	
	if event.phase == "began" then
		if (primeiroClique == nil) then
			primeiroClique = {linha = event.target.linha, coluna = event.target.coluna}
			print("Primeiro Clique setado")
			event.target:removeEventListener("touch", fazJogada)
		elseif (segundoClique == nil) then
			segundoClique = {linha = event.target.linha, coluna = event.target.coluna}
			print("Segundo Clique setado")
			event.target:removeEventListener("touch", fazJogada)

			if(tabuleiroView:checarJogada(primeiroClique, segundoClique) ~= nil) then
				
			end

		end
		event.target:setFillColor(1, 1, 1)
	end
end

function tabuleiroView:attEstado()
	
end

function tabuleiroView:checarJogada(clique1, clique2)
	local orientacao = {linha = clique2.linha - clique1.linha, 
						coluna = clique2.coluna - clique1.coluna}

	if (orientacao.linha ~= 0 and orientacao.coluna ~= 0) then return nil end
	return true, orientacao
end

return tabuleiroView