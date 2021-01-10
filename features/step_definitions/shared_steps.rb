# acesso ao dashboard
Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
end

# alert de erro
Então('vejo a mensagem de alerta: {string}') do |expected_alert|
  sleep 1
  alert = find('.alert.alert-dark')
  expect(alert.text).to eql expected_alert
end