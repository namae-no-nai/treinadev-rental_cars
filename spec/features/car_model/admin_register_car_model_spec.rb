require 'rails_helper'

feature 'User register client' do
  scenario 'from index page' do
    visit root_path
    click_on 'Modelos de carros'

    expect(page).to have_link('Cadastrar modelo de carro', href: new_car_model_path)
  end

  scenario 'successfully' do
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    visit root_path
    click_on 'Modelos de carros'
    click_on 'Cadastrar modelo de carro'

    fill_in 'Nome', with: 'Corolla'
    fill_in 'Ano', with: '2021'
    select 'Toyota', from: 'Fabricante'
    fill_in 'Motor', with: '2.0'
    select 'B', from: 'Categoria'
    fill_in 'Tipo de combustível', with: 'gasolina'
    click_on 'Enviar'

    expect(page).to have_content('Corolla')
    expect(page).to have_content('2021')
    expect(page).to have_content('Toyota')
    expect(page).to have_content('2.0')
    expect(page).to have_content('Categoria: B')
    expect(page).to have_content('gasolina')
    expect(page).to have_link('Voltar')
  end

  scenario 'and can not be blank' do
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    visit root_path
    click_on 'Modelos de carros'
    click_on 'Cadastrar modelo de carro'

    fill_in 'Nome', with: ''
    fill_in 'Ano', with: ''
    select 'Toyota', from: 'Fabricante'
    fill_in 'Motor', with: ''
    select 'B', from: 'Categoria'
    fill_in 'Tipo de combustível', with: ''

    click_on 'Enviar'

    expect(page).to have_content("Nome não pode ficar em branco")
    expect(page).to have_content("Ano não pode ficar em branco")
    expect(page).to have_content("Motor não pode ficar em branco")
    expect(page).to have_content("Tipo de combustível não pode ficar em branco")
  end
end

