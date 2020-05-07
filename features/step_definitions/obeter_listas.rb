Dado("que eu faça uma requisição do tipo GET para a url {string} para listar as marcas") do |url|
  @raiaDrogadil = RaiaDrogadil.new
  @response = @raiaDrogadil.get_url(url)
  puts @response.to_s.force_encoding("UTF-8")
end

E("localizo o código da marca {string}") do |marca|
  @marca = @response.find { |aux| aux["nome"].match(marca) }
  @marca_nome = marca
  @marca_codigo = @marca["codigo"]
  puts "código da marca #{@marca_codigo}"
end

Então("o status code deve ser {int}") do |codigo_de_status|
  expect(@response.code).to eq codigo_de_status
end

E("retornar nomes e códigos") do
  expect(@response[0]["nome"]).not_to be nil
  expect(@response[0]["codigo"]).not_to be nil
end

Dado("que eu faça uma requisição do tipo GET para a url {string} para listar os modelos de marca {string}") do |url, marca|
  step "que eu faça uma requisição do tipo GET para a url '#{url}' para listar as marcas"
  step "localizo o código da marca '#{marca}'"

  url_modelos = "/carros/marcas/#{@marca_codigo}/modelos"

  @response = @raiaDrogadil.get_url(url_modelos)
  puts @response.to_s.force_encoding("UTF-8")
end

E("localizo o código do modelo {string}") do |modelo|
  @modelo = @response["modelos"].find { |aux| aux["nome"].match(modelo) }
  @modelo_nome = modelo
  @modelo_codigo = @modelo["codigo"]
  puts "código do modelo #{@modelo_codigo}"
end

E("retornar nomes e códigos dos modelos") do
  expect(@response["modelos"][0]["nome"]).not_to be nil
  expect(@response["modelos"][0]["codigo"]).not_to be nil
end

Dado("que eu faça uma requisição do tipo GET para a url {string} para listar os anos de marca {string} e modelo {string}") do |url, marca, modelo|
  step "que eu faça uma requisição do tipo GET para a url '#{url}' para listar os modelos de marca '#{marca}'"
  step "localizo o código do modelo '#{modelo}'"
 
  url_anos = "/carros/marcas/#{@marca_codigo}/modelos/#{@modelo_codigo}/anos"
  
  @response = @raiaDrogadil.get_url(url_anos)
  puts @response.to_s.force_encoding("UTF-8")
end

E("localizo o código do ano {string}") do |ano|
  @ano = @response.find { |aux| aux["nome"].match(ano) }
  @ano_nome = ano.to_i
  @ano_codigo = @ano["codigo"]
  puts "código da ano #{@ano_codigo}"
end

Dado("que eu faça uma requisição do tipo GET para a url {string} para listar os anos de marca {string} e modelo {string} e ano {string}") do |url, marca, modelo, ano|
  step "que eu faça uma requisição do tipo GET para a url '#{url}' para listar os anos de marca '#{marca}' e modelo '#{modelo}'"
  step "localizo o código do ano '#{ano}'"

  url_informacoes = "/carros/marcas/#{@marca_codigo}/modelos/#{@modelo_codigo}/anos/#{@ano_codigo}"

  @response = @raiaDrogadil.get_url(url_informacoes)
  puts @response.to_s.force_encoding("UTF-8")
end

E("retornar as informações do veiculo") do 
  expect(@response["Marca"]).to eql(@marca_nome)
  expect(@response["Modelo"]).to eql(@modelo_nome)
  expect(@response["AnoModelo"]).to eql(@ano_nome)
  valor = @response["Valor"]
  codigo_fipe = @response["CodigoFipe"]
  puts "Informações do veículo:"
  puts "Marca: #{@marca_nome}"
  puts "Modelo: #{@modelo_nome}"
  puts "ano: #{@ano_nome}"
  puts "Valor: #{valor}"
  puts "CodigoFipe: #{codigo_fipe}"
end