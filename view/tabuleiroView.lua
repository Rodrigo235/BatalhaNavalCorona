tabuleiroView = {}

function tabuleiroView:getTabuleiro()

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
	if (event.phase == "began") then
		event.target:setFillColor(1, 1, 1)
	end
end


return tabuleiroView