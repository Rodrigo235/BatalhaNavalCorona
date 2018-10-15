local jogadorModel = require "objects.jogadorModel"
local tabuleiroModel = require "objects.tabuleiroModel"
local naviosModel = require "objects.naviosModel"
local textoView = require "view.textoView"

local tabuleiroView = {}

local id = 2
local primeiroClique
local segundoClique

local jogador = jogadorModel:newJogador("Nekrols")

function tabuleiroView:newTabuleiro()

	local deslocamentoX = 0
	local deslocamentoY = display.actualContentWidth * 0.25
	local tamanhoDoQuadrado = 25

	tabuleiroView.tabuleiroCriado = {
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

			tabuleiroView.tabuleiroCriado[i][j] = display.newRect(deslocamentoX + 20, deslocamentoY + 20, tamanhoDoQuadrado, tamanhoDoQuadrado)
			tabuleiroView.tabuleiroCriado[i][j]:setFillColor(0.2, 0.2, 0.2)
			tabuleiroView.tabuleiroCriado[i][j].linha = i
			tabuleiroView.tabuleiroCriado[i][j].coluna = j
			tabuleiroView.tabuleiroCriado[i][j]:addEventListener("touch", fazJogada)

			deslocamentoX = deslocamentoX + (display.actualContentWidth * 0.1)

		end
		deslocamentoY = deslocamentoY + (display.actualContentHeight * 0.048)
		deslocamentoX = 0
	end

	return tabuleiroView.tabuleiroCriado

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
				print("1º Linha ______ " ..primeiroClique.linha)
				print("1º Coluna ______ " ..primeiroClique.coluna)

				print("2º Linha ______ " ..segundoClique.linha)
				print("2º Coluna ______ " ..segundoClique.coluna)

				print("Orientacao Linha: ________" ..orientacao.linha)
				print("Orientacao Coluna: ________" ..orientacao.coluna)
				jogador.mapa = tabuleiroModel:inserirNavio(jogador, primeiroClique.linha, primeiroClique.coluna, navioDaVez, orientacao)
				tabuleiroView:attEstado(jogador)

				primeiroClique = nil
				segundoClique = nil
				id = id + 1
			end

		end
		event.target:setFillColor(navioDaVez.rgb[1], navioDaVez.rgb[2], navioDaVez.rgb[3])
	end
end

function tabuleiroView:attEstado(argJogador)
	
	print("entrou no attEstado" ..#argJogador.mapa)
	for i = 1, #argJogador.mapa do
		for j = 1, #argJogador.mapa[i] do
			if(argJogador.mapa[i][j] ~= 0) then
				for k,v in pairs(argJogador.navios) do
					if(v.id == argJogador.mapa[i][j]) then
						tabuleiroView.tabuleiroCriado[i][j]:setFillColor(v.rgb[1], v.rgb[2], v.rgb[3])
					end
				end
			end
		end
	end
end

return tabuleiroView