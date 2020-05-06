#language: pt

@get
Funcionalidade: Listar dados por categoria

  @get_marca
  Cenário: Get marca
    Dado que eu faça uma requisição do tipo GET para o endpoint "/carros/marcas"
    E localizo o código da marca "GM - Chevrolet"
    Então o status code deve ser 200
    E retornar uma lista com os nomes e códigos

  @get_modelo
  Cenário: Get marca
    Dado que eu faça uma requisição do tipo GET para o endpoint dos modelos "/carros/marcas"
    E localizo o código do modelo "CRUZE LTZ 1.8 16V FlexPower 4p Aut."
    Então o status code deve ser 200
    E retornar uma lista com os nomes e códigos
