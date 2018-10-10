local tabuleiroView = require "view.tabuleiroView"
local texto = require "view.textoView"

local largura, altura = display.actualContentWidth, display.actualContentHeight

tabuleiroView:getTabuleiro()

texto:newTexto("titulo", "Batalha Naval", largura / 2, altura * 0.05, 40)
texto:newTexto("navio", "Fragata", largura / 2, altura * 0.8, 30)
texto:newTexto("info", "Adicione o Navio", largura / 2, altura * 0.7, 30)