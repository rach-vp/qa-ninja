@login_data = LoginPage.new

Dado('que acesso a página principal') do
  @login_data.open
end

Quando('submeto minhas credenciais com {string} e {string}') do |email, password|

  @login_data.email_box.set email
  @login_data.password_box.set password
  @login_data.enter

=begin
  find('#user_email').set email
  find('#user_password').set password
  click_button 'Entrar'
=end
end
