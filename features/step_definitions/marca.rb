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

Dado("que eu faça uma requisição do tipo GET para a url para listar os modelos") do 
  url = "/carros/marcas/#{@marca_codigo}/modelos"
  @response = @raiaDrogadil.get_url(url)
  puts @response.to_s.force_encoding("UTF-8")
end


E("localizo o código do modelo {string}") do |modelo|
  @modelo = @response["modelos"].find { |aux| aux["nome"].match(modelo) }
  @modelo_nome = modelo
  @modelo_codigo = @modelo["codigo"]
  puts "código do modelo #{@modelo_codigo}"
end

Dado("que eu faça uma requisição do tipo GET para a url para listar os anos") do 
  url = "/carros/marcas/#{@marca_codigo}/modelos/#{@modelo_codigo}/anos"
  @response = @raiaDrogadil.get_url(url)
  puts @response.to_s.force_encoding("UTF-8")
end

E("localizo o código do ano {string}") do |ano|
  @ano = @response.find { |aux| aux["nome"].match(ano) }
  @ano_nome = ano.to_i
  @ano_codigo = @ano["codigo"]
  puts "código da ano #{@ano_codigo}"
end

Quando("faço uma requisição do tipo GET para a url do veiculo") do 
  url = "/carros/marcas/#{@marca_codigo}/modelos/#{@modelo_codigo}/anos/#{@ano_codigo}"
  @response = @raiaDrogadil.get_url(url)
  puts @response.to_s.force_encoding("UTF-8")
end

E("retornar as informações do veiculo") do 
  expect(@response["Marca"]).to eql(@marca_nome)
  expect(@response["Modelo"]).to eql(@modelo_nome)
  expect(@response["AnoModelo"]).to eql(@ano_nome)
  valor = @response["Valor"]
  codigo_fipe = @response["CodigoFipe"]
  puts "Valor: #{valor}"
  puts "CodigoFipe: #{codigo_fipe}"
end