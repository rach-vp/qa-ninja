Dado('que acesso a página principal') do
  visit '/'
  sleep 2
end

Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
  find('#email').set email
  find('#password').set password
  sleep 2
  click_button 'Entrar'
end
