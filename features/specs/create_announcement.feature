# language: pt

Funcionalidade: Cadastro de Anúncios
  Sendo um usuário cadastrado no Rocklov que possui equipamentos musicais
  Quero cadastrar equipamentos
  Para que eu possa disponibilizar para locação

  Cenario: Novo equipamento

    Dado que tenho o seguinte equipamento:
      | image | fender-sb.jpg |
      | nome  | Fender Strato |
      | type  | Cordas        |
      | price | 200           |
    Quando submeto o cadastro desse item
    Então devo ver esse item em meu Dashboard