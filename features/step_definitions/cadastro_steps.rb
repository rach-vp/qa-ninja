Dado('que acesso a página de cadastro') do
  visit 'http://rocklov-web:3000/signup'
end

# novo-cadastro
Quando('submeto o meu cadastro completo') do
  email = 'teste@gmail.com'

  DB_handling.new.remove_user(email)

  find('#fullName').set Faker::Name.name
  find('#email').set email
  find('#password').set Faker::Alphanumeric.alpha(number: 10)
  click_button "Cadastrar"
end

Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
end

# sem-nome
Quando('submeto o meu cadastro sem o nome') do
  find('#email').set Faker::Internet.free_email
  find('#password').set Faker::Alphanumeric.alpha(number: 10)
  click_button "Cadastrar"
end

Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
  alert = find('.alert.alert-dark')
  expect(alert.text).to eql 'Oops. Informe seu nome completo!'
end

# sem-email
Quando('submeto o meu cadastro sem o email') do
  find('#fullName').set Faker::Name.name
  find('#password').set Faker::Alphanumeric.alpha(number: 10)
  click_button "Cadastrar"
end

Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
  alert = find('.alert.alert-dark')
  expect(alert.text).to eql 'Oops. Informe um email válido!'
end

# com-email-incorreto
Quando('submeto o meu cadastro com email incorreto') do
  find('#fullName').set Faker::Name.name
  find('#email').set 'teste*gmail.comp'
  find('#password').set Faker::Alphanumeric.alpha(number: 10)
  click_button "Cadastrar"
end
# sem-senha
Quando('submeto o meu cadastro sem a senha') do
  find('#fullName').set Faker::Name.name
  find('#email').set Faker::Internet.free_email
  click_button "Cadastrar"
end

Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
  alert = find('.alert.alert-dark')
  expect(alert.text).to eql 'Oops. Informe sua senha secreta!'
end
