Dado('que acesso a página de cadastro') do
  visit '/signup'
  sleep 2
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
  user = table.hashes.first

  DB_handling.new.remove_user(user[:email])

  find('#fullName').set user[:name]
  find('#email').set user[:email]
  find('#password').set user[:password]
  sleep 2
  click_button 'Cadastrar'
end
