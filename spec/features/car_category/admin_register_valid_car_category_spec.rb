require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and name must be unique' do
    CarCategory.create!(name: 'SUV', daily_rate: '19.99', car_insurance: '22.30', third_party_insurance: '12.30')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'Cadastrar nova categoria'

    fill_in 'Categoria', with: 'SUV'
    fill_in 'Diária', with: '19.00'
    fill_in 'Seguro do carro', with: '13.22'
    fill_in 'Seguro contra terceiros', with: '30.00'
    click_on 'Enviar'

    expect(page).to have_content('Categoria já está em uso')
  end

  scenario 'and name can not be blank' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'Cadastrar nova categoria'

    fill_in 'Categoria', with: ''
    fill_in 'Diária', with: ''
    fill_in 'Seguro do carro', with: ''
    fill_in 'Seguro contra terceiros', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Categoria não pode ficar em branco')
    expect(page).to have_content('Diária não pode ficar em branco')
    expect(page).to have_content('Seguro do carro não pode ficar em branco')
    expect(page).to have_content('Seguro contra terceiros não pode ficar em branco')
  end

end

