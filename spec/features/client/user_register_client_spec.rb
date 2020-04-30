require 'rails_helper'

feature 'User register client' do
  scenario 'from index page' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Clientes'

    expect(page).to have_link('Cadastrar cliente', href: new_client_path)
  end

  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Alguém'
    fill_in 'CPF', with: '588.647.870-11'
    fill_in 'Email', with: 'alguem@algumacoisa.com'
    click_on 'Enviar'

    expect(current_path).to eq client_path(Client.last.id)
    expect(page).to have_content('Alguém')
    expect(page).to have_content('588.647.870-11')
    expect(page).to have_content('alguem@algumacoisa.com')
    expect(page).to have_link('Voltar')
  end
end
