require 'rails_helper'

feature 'Admin deletes client' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    c = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")

    visit root_path
    click_on 'Modelos de carros'
    click_on "details-#{c.id}"
    click_on 'Apagar modelo de carro'

    expect(current_path).to eq car_models_path
    expect(page).to have_content('Nenhum modelo de carro cadastrado')
  end

  scenario 'and keep anothers' do
    fiat = Manufacturer.create!(name: 'Fiat')
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    cat_b = CarCategory.create!(name: 'b', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    c = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")
    CarModel.create!(name: 'Corolla', year:2019, manufacturer: toyota, motorization: "1.0", car_category: cat_b, fuel_type: "alcool")

    visit root_path
    click_on 'Modelos de carros'
    click_on "details-#{c.id}"
    click_on 'Apagar modelo de carro'

    expect(current_path).to eq car_models_path
    expect(page).not_to have_content('Uno')
    expect(page).not_to have_content('2020')
    expect(page).not_to have_content("2.0")
    expect(page).to have_content('Corolla')
    expect(page).to have_content('2019')
    expect(page).to have_content('Toyota')
  end
end
