require 'rails_helper'

feature 'Admin edits car category' do
  scenario 'successfully' do
    CarCategory.create(name: 'SUV', daily_rate: '19.99', car_insurance: '22.39', third_party_insurance: '12.39')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'SUV'
    click_on 'Editar'
    fill_in 'Categoria', with: 'compacto'
    fill_in 'Diária', with: '19.11'
    fill_in 'Seguro do carro', with: '13.24'
    fill_in 'Seguro contra terceiros', with: '13.33'
    click_on 'Enviar'

    expect(page).to have_content('compacto')
    expect(page).to have_content('19,11')
    expect(page).to have_content('13,24')
    expect(page).to have_content('13,33')
  end

  scenario 'can not be blank' do
    CarCategory.create(name: 'SUV', daily_rate: '19.99', car_insurance: '22.30', third_party_insurance: '12.30')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'SUV'
    click_on 'Editar'
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

  scenario 'unique' do
    CarCategory.create!(name: 'SUV', daily_rate: '19.99', car_insurance: '22.30', third_party_insurance: '12.30')
    CarCategory.create!(name: 'compacto', daily_rate: '19.99', car_insurance: '22.30', third_party_insurance: '12.30')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'SUV'
    click_on 'Editar'
    fill_in 'Categoria', with: 'compacto'
    fill_in 'Diária', with: '19.10'
    fill_in 'Seguro do carro', with: '13.24'
    fill_in 'Seguro contra terceiros', with: '14.33'
    click_on 'Enviar'

    expect(page).to have_content('Categoria já está em uso')
  end

  scenario 'greater than 0' do
    CarCategory.create!(name: 'A', daily_rate: '19.99', car_insurance: '22.30', third_party_insurance: '12.30')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Categoria', with: 'A'
    fill_in 'Diária', with: '0'
    fill_in 'Seguro do carro', with: '0'
    fill_in 'Seguro contra terceiros', with: '0'
    click_on 'Enviar'

    expect(page).to have_content("Diária deve ser maior que 0.0")
    expect(page).to have_content("Seguro do carro deve ser maior que 0.0")
    expect(page).to have_content("Seguro contra terceiros deve ser maior que 0.0")
  end
end

