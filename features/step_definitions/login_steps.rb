Dado('que acesso a página principal') do
  visit '/'
end

Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
  find('#user_email').set email
  find('#user_password').set password
  click_button 'Entrar'
end
