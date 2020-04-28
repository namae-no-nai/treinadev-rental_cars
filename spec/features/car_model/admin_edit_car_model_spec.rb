require 'rails_helper'

feature 'Admin edits car_model' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    c = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    
    visit root_path
    click_on 'Modelos de carros'
    click_on "details-#{c.id}"
    click_on 'Editar'
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
  end

  scenario 'cant be blank' do
    fiat = Manufacturer.create!(name: 'Fiat')
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    c = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    
    visit root_path
    click_on 'Modelos de carros'
    click_on "details-#{c.id}"
    click_on 'Editar'
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
