#language: pt

@informacoes
Funcionalidade: Obter informacoes de veiculo especifico

@get_info
Cenário: Obter informações completas 
  Dado que eu faça uma requisição do tipo GET para o endpoint "/carros/marcas" para listar as marcas
  E localizo o código da marca "GM - Chevrolet"
  Dado que eu faça uma requisição do tipo GET para o endpoint para listar os modelos
  E localizo o código do modelo "CRUZE LTZ 1.8 16V FlexPower 4p Aut."
  Dado que eu faça uma requisição do tipo GET para o endpoint para listar os anos
  E localizo o código do ano "2016 "
  Quando faço uma requisição do tipo GET para o endpoint do veiculo
  Então o status code deve ser 200
  E retornar as informações do veiculo