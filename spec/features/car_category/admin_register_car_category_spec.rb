require 'rails_helper'

feature 'Admin register car category' do
  scenario 'from index page' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_link('Cadastrar nova categoria', href: new_car_category_path)
  end

  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'Cadastrar nova categoria'

    fill_in 'Categoria', with: 'utilitário'
    fill_in 'Diária', with: '30.0'
    fill_in 'Seguro do carro', with: '50.0'
    fill_in 'Seguro contra terceiros', with: '75.52'
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('utilitário')
    expect(page).to have_content('30,00')
    expect(page).to have_content('50,00')
    expect(page).to have_content('75,52')
    expect(page).to have_link('Voltar')
  end
end
