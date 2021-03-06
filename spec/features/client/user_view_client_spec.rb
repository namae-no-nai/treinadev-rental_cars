require 'rails_helper'

feature 'User view Clients' do
  scenario 'successfully' do
    Client.create!(name: 'Algum nome', document: '766.075.700-89', email: 'algumacois@outracoisa.com')
    Client.create!(name: 'Outro nome', document: '892.317.680-00', email: 'outracois@outracoisa.com')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Clientes'

    expect(page).to have_content('Algum nome')
    expect(page).to have_content('Outro nome')
  end

  scenario 'and view details' do
    Client.create!(name: 'Algum nome', document: '766.075.700-89', email: 'algumacois@outracoisa.com')
    Client.create!(name: 'Outro nome', document: '892.317.680-00', email: 'outracois@outracoisa.com')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'

    expect(page).to have_content('Algum nome')
    expect(page).to have_content('766.075.700-89')
    expect(page).to have_content('algumacois@outracoisa.com')
    expect(page).not_to have_content('Outro nome')
  end

  scenario 'and no subsidiaries are created' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content('Nenhum cliente cadastrado')
  end

  scenario 'and return to home page' do
    Client.create!(name: 'Algum nome', document: '766.075.700-89', email: 'algumacois@outracoisa.com')
    Client.create!(name: 'Outro nome', document: '892.317.680-00', email: 'outracois@outracoisa.com')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Clientes'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to clients page' do
    Client.create!(name: 'Algum nome', document: '766.075.700-89', email: 'algumacois@outracoisa.com')
    Client.create!(name: 'Outro nome', document: '892.317.680-00', email: 'outracois@outracoisa.com')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Voltar'

    expect(current_path).to eq clients_path
  end
end
