#language: pt

Funcionalidade: Cadastro
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "picanco.raquel@gmail.com" e "qwerty123"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Erro no Login
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<password_input>"
        Então vejo a mensagem de alerta: "<message_output>"

        Exemplos:
            | email_input              | password_input | message_output                   |
            | picanco.raquel@gmail.com | oie123         | Usuário e/ou senha inválidos.    |
            | non-eczist@bol.com.br    | qwerty123      | Usuário e/ou senha inválidos.    |
            | email-errado.com         | qwerty123      | Oops. Informe um email válido!   |
            |                          | qwerty123      | Oops. Informe um email válido!   |
            | picanco.raquel@gmail.com |                | Oops. Informe sua senha secreta! |
