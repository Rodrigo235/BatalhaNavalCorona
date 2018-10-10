local naviosModel = require "objects.naviosModel"
local tabuleiroModel = require "objects.tabuleiroModel"
local jogador = {}


function jogador:newJogador(argNome)
	local player = {nome = argNome, 
					navios = naviosModel:newNavios(), 
					mapa = tabuleiroModel:newMapa(0), 
					mapaDoAdversario = tabuleiroModel:newMapa("?")}

	return player
end

return jogador