require 'rails_helper'
  
feature 'User search customer' do
  scenario 'by exact name' do
    client = Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacoisa@outracoisa.com')
    other_client = Client.create!(name: 'Outro nome', document: '079.471.830-23', email: 'outracoisa@outracoisa.com')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
  
    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: client.name
    click_on 'Buscar'

    expect(page).to have_content(client.name)
    expect(page).not_to have_content(other_client.name)
  end
end
