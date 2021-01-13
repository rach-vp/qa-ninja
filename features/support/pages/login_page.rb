
class LoginPage
  include Capybara::DSL

  def open
    visit '/'
  end

  def email_box
    return find('#user_email')
  end

  def password_box
    return find('#user_password')
  end

  def enter
    click_button 'Entrar'
  end
end
=begin
  attr_accessor :page, :email_box, :password_box

  def initialize
    @page = '/'
    @email_box = '#user_email'
    @password_box = '#user_password'
  end

  def login_page
    return @page
  end

  def email_box
    return @email_box
  end

  def password_box
    return @password_box
  end

  def login
    click_button "Entrar"
  end
=end

# teste = LoginPage.new
# puts teste.login_page