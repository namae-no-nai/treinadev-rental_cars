require 'rails_helper'

feature 'Admin deletes subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '14.380.277/0001-00', address: 'rua sem nome')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Apagar filial'

    expect(current_path).to eq subsidiaries_path
    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and keep anothers' do
    Subsidiary.create!(name: 'Nova', cnpj: '14.380.277/0001-00', address: 'rua sem nome')
    Subsidiary.create!(name: 'Outra', cnpj: '31.538.806/0001-61', address: 'rua sem outro nome')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Apagar filial'

    expect(current_path).to eq subsidiaries_path
    expect(page).not_to have_content('Nova')
    expect(page).not_to have_content('14.380.277/0001-00')
    expect(page).not_to have_content('rua sem nome')
    expect(page).to have_content('Outra')
  end
end
