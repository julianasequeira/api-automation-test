Dado("que eu faça uam requisição do tipo GET para o endpoint {string}") do |endpoint|
  @raiaDrogadil_api = RaiaDrogadil_api.new
  @response = @raiaDrogadil_api.get_endpoint(endpoint)
  puts @response.to_s.force_encoding("UTF-8")
end

Então("o status code deve ser {int}") do |status_code|
  expect(@response.code).to eq status_code
end


E("retornar uma lista de marcas e seus códigos") do
  expect(@response[0]["nome"]).not_to be nil
  expect(@response[0]["codigo"]).not_to be nil
end
