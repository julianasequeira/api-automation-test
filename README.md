# Projeto

Projeto para automatização de testes de consulta em informações de veículos utilizando a API: https://deividfortuna.github.io/fipe/ 

## Instalação

Para execução local do projeto é necessário a instalação de Ruby versão 2.5.7 devkit em https://rubyinstaller.org/. 
A instalação deve ser feita no diretório C: e selecionar as opções de "Add Ruby executables to your Path" e "Associate .rb and .rbw files with this Ruby installantion". Em seguida, executar o instalador e extrair para o diretório de instalação. 

Após a instalção do Ruby é necessário instalar as gens utilizadas no projeto, para isso execute o comando 

$ bundle install.


## Execução

Para executar o cenário de listagem das informações do veículo você deve executar o seguinte comando na raiz do projeto 

$ bundle exec cucumber -p default -t @listar_informacoes
    