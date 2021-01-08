#language: pt

Funcionalidade: Cadastro
  Sendo um músico que possui equipamentos musicais
  Quero fazer o meu cadastro no RockLov
  Para que eu possa disponibilizá-los para locação

  @novo-cadastro
  Cenario: Cadastro feito com sucesso
    Dado que acesso a página de cadastro
    Quando submeto o seguinte formulário de cadastro:
      |      name      |      email      | password  |
      | Raquel Picanço | teste@gmail.com | qwerty123 |
    Então sou redirecionado para o Dashboard

  Esquema do Cenário: Erro no cadastro
    Dado que acesso a página de cadastro
    Quando submeto o seguinte formulário de cadastro:
      |     name     |     email     |     password     |
      | <name_input> | <email_input> | <password_input> |
    Então vejo a mensagem de alerta: "<message_output>"

    Exemplos:
      |   name_input   |      email_input      |  password_input  |          message_output          |
      |                |    teste@gmail.com    |     qwerty123    | Oops. Informe seu nome completo! |
      | Raquel Picanço |                       |     qwerty123    |  Oops. Informe um email válido!  |
      | Raquel Picanço |    teste@gmail.com    |                  | Oops. Informe sua senha secreta! |
      | Raquel Picanço | teste..hotmail.organi |     qwerty123    |  Oops. Informe um email válido!  |
