# language: pt

Funcionalidade: Cadastro de Anúncios
  Sendo um usuário cadastrado no Rocklov que possui equipamentos musicais
  Quero cadastrar equipamentos
  Para que eu possa disponibilizar para locação

  Cenario: Novo equipamento
    Dado que faço login com o e-mail "picanco.raquel@gmail.com" e a senha "qwerty123"
      E acesso o formulário de criação de anúncio
      E entro com o seguinte formulario:
        | image | fender-sb.jpg |
        | name  | Fender Strato |
        | type  | Cordas        |
        | price | 200           |
    Quando submeto o cadastro desse item
    Então devo ver esse item em meu Dashboard