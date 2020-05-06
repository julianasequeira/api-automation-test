#language: pt

@marca
Funcionalidade: Listar marcas

  @get_marca
  Cenário: Get marca
    Dado que eu faça uam requisição do tipo GET para o endpoint "/carros/marcas"
    Então o status code deve ser 200
    E retornar uma lista de marcas e seus códigos
