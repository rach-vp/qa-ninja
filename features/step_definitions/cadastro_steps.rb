Dado('que acesso a página de cadastro') do
  visit 'http://rocklov-web:3000/signup'
end

Quando('submeto o meu cadastro completo') do
  find('#fullName').set 'Raquel Picanço'
  find('#email').set 'picanco.raquel@gmail.com'
  find('#password').set 'senha'
  click_button "Cadastrar"
  sleep 5
end

Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
  sleep 5
end
