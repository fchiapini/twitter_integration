# TWITTER STREAMING INTEGRATION

Aplicativo ruby para conexão com a API de streaming do Twitter.

O aplicativo recebe uma ou mais palavras-chave e executa uma busca na API de Streaming do Twitter.

Enquanto o aplicativo recebe os tweets encontrados, eles são enviados a API rails_twitter_api para serem armazenados no banco de dados através de um post request.

São utilizadas as seguintes gems:

twitter gem - gem para conexão com a API do Twitter

net/http gem - gem para a criação do post request e envio dos tweets a API rails.

## Iniciando:

Após realizada toda a configuração da API rails_twitter_api. Se você ainda não configurou acesse: [Rails Twitter API] para informações de configuração.

No terminal do seu S.O. acesse o diretório do aplicativo:

workspace/twitter_integration

Busca na API do Twitter para uma palavra-chave:

Exemplo:

```sh
ruby twitter_integration.rb "water"
```

Busca de mais de uma palavra-chave:

Exemplo:

```sh
ruby twitter_integration.rb "water" "soccer"
```

Parar a execução do aplicativo no terminal execute:

ctrl + c

O aplicativo monta o tweet a ser enviado no post request a API Rails Twitter API em formato json. 


[Rails Twitter API]: <https://github.com/fchiapini/rails_twitter_api>

