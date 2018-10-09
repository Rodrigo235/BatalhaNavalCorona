local tabuleiroView = require "view.tabuleiroView"
local texto = require "view.textoView"

local largura, altura = display.actualContentWidth, display.actualContentHeight

tabuleiroView:constroiTabuleiro()

texto:newTexto("titulo", "Batalha Naval", largura / 2, altura * 0.05, 40)

texto:newTexto("rodape", "Rodape", largura / 2, altura * 0.8, 40)

texto:setTexto("titulo", "Tste")