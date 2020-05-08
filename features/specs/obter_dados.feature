#language: pt

@listar_veiculos
Funcionalidade: Obter informações de veículo específico

@listar_marca
Cenário: Listar marcas disponíveis
  Dado que eu faça uma requisição do tipo GET para a url "/carros/marcas" para listar as marcas
  E localizo o código da marca "GM - Chevrolet"
  Então o status code deve ser 200
  E retornar nomes e códigos

@listar_modelo
Cenário: Listar modelo da marca escolhido
  Dado que eu faça uma requisição do tipo GET para a url "/carros/marcas" para listar os modelos de marca "GM - Chevrolet"
  E localizo o código do modelo "CRUZE LTZ 1.8 16V FlexPower 4p Aut."
  Então o status code deve ser 200
  E retornar nomes e códigos dos modelos

@listar_ano
Cenário: Listar anos do modelo e marca escolhido
  Dado que eu faça uma requisição do tipo GET para a url "/carros/marcas" para listar os anos de marca "GM - Chevrolet" e modelo "CRUZE LTZ 1.8 16V FlexPower 4p Aut."
  E localizo o código do ano "2016 "
  Então o status code deve ser 200
  E retornar nomes e códigos

@listar_informacoes
Cenário: Listar anos do modelo e marca escolhido
  Dado que eu faça uma requisição do tipo GET para a url "/carros/marcas" para listar os anos de marca "GM - Chevrolet" e modelo "CRUZE LTZ 1.8 16V FlexPower 4p Aut." e ano "2016 "
  Então o status code deve ser 200
  E retornar as informações do veículo