local jogadorModel = require "objects.jogadorModel"
local tabuleiroModel = require "objects.tabuleiroModel"
local naviosModel = require "objects.naviosModel"

local tabuleiroView = {}

local id = 2
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
	
	local nomeNavio, navioDaVez = naviosModel:findById(id)

	if event.phase == "began" then
		if (primeiroClique == nil) then
			primeiroClique = {linha = event.target.linha, coluna = event.target.coluna}
			event.target:removeEventListener("touch", fazJogada)
		elseif (segundoClique == nil) then
			segundoClique = {linha = event.target.linha, coluna = event.target.coluna}
			event.target:removeEventListener("touch", fazJogada)

			local orientacao = tabuleiroModel:checarJogada(primeiroClique, segundoClique)

			if(orientacao ~= nil) then
				jogador.mapa = tabuleiroModel:inserirNavio(jogador, event.target.linha, event.target.coluna, jogador.navios.navioDaVez, orientacao)
			end

		end
		event.target:setFillColor(navioDaVez.rgb[1], navioDaVez.rgb[2], navioDaVez.rgb[3])
	end
end

function tabuleiroView:attEstado()
	
end

return tabuleiroView