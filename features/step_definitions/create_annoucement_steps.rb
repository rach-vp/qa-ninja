Dado('que faço login com o e-mail {string} e a senha {string}') do |email, password|
  @email = email

  visit '/'
  sleep 2
  find('#email').set email
  find('#password').set password
  sleep 2
  click_button 'Entrar'
end

Dado('acesso o formulário de criação de anúncio') do
  sleep 2
  click_button 'Criar anúncio'
  # Check if I'm in the correct page
  expect(page).to have_css '#equipoForm'
end

Dado('entro com o seguinte formulario:') do |table|
  @announcement = table.rows_hash
end

Quando('submeto o cadastro desse item') do
  DB_handling.new.remove_equipo(@email, @announcement[:name])

  image_path = "#{Dir.pwd}/features/support/fixtures/images/equipos-v2/#{@announcement[:image]}"
  log image_path
  sleep 2
  find('#thumbnail input[type=file]', visible: false).set image_path
  find('#name').set @announcement[:name]
  find('#category').find('option', text: @announcement[:type]).select_option
  find('#price').set @announcement[:price]
  sleep 2
  click_button 'Cadastrar'
  sleep 2
end

Então('devo ver esse item em meu Dashboard') do
  # Check bg img format to use here => (*)
  if (@announcement[:image].include?('.jpg'))
    equipo_name = @announcement[:image].partition('.jpg')[0]
  elsif (@announcement[:image].include?('.jpeg'))
    equipo_name = @announcement[:image].partition('.jpeg')[0]
  elsif (@announcement[:image].include?('.png'))
    equipo_name = @announcement[:image].partition('.png')[0]
  elsif (@announcement[:image].include?('.gif'))
    equipo_name = @announcement[:image].partition('.gif')[0]
  end
  log "equipo name: #{equipo_name}!!"

  annoucement_name = find('ul.equipo-list li strong')
  expect(annoucement_name.text).to eql @announcement[:name]
  annoucement_price = find('ul.equipo-list li span')
  expect(annoucement_price.text).to include @announcement[:price]
  # (*) HERE
  annoucemnt_equipo = find('ul.equipo-list li header')
  expect(annoucemnt_equipo['style']).to include equipo_name
end
