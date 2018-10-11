local tabuleiroView = require "view.tabuleiroView"
local texto = require "view.textoView"

local largura, altura = display.actualContentWidth, display.actualContentHeight

tabuleiroView:newTabuleiro()

texto:newTexto("titulo", "Batalha Naval", largura / 2, altura * 0.05, 40)
texto:newTexto("navio", "", largura / 2, altura * 0.8, 30)
texto:newTexto("info", "Adicione o Navio", largura / 2, altura * 0.7, 30)

--texto:setTexto("titulo", "lalala")
