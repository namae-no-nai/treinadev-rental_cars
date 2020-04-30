require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Filial A'
    fill_in 'CNPJ', with: '31.538.806/0001-61'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Filial A')
    expect(page).to have_content('31.538.806/0001-61')
    expect(page).to have_content('Rua Sem Nome, 00')
    expect(page).to have_link('Voltar')
  end
end
