Dado('que acesso a página de cadastro') do
  visit 'http://rocklov-web:3000/signup'
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
  user = table.hashes.first

  DB_handling.new.remove_user(user[:email])

  find('#fullName').set user[:name]
  find('#email').set user[:email]
  find('#password').set user[:password]
  # sleep 5
  click_button "Cadastrar"
end

# erro ao criar cadastro
Então('vejo a mensagem de alerta: {string}') do |expected_alert|
  alert = find('.alert.alert-dark')
  expect(alert.text).to eql expected_alert
  # sleep 5
end
