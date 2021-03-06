require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'from index page' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_link('Registrar fabricante', href: new_manufacturer_path)
  end

  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(current_path).to eq manufacturer_path(Manufacturer.last.id)
    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end
end
