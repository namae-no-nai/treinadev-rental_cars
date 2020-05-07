require 'rails_helper'

feature 'Admin deletes client' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    c = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    car = Car.create!(license_plate:'ABC1234', color: "Branco", car_model: c, mileage: "0", subsidiary: subsidiary)
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Carros'
    click_on "details-#{car.id}"
    click_on 'Apagar carro'

    expect(current_path).to eq cars_path
    expect(page).to have_content('Nenhum carro registrado')
  end

  scenario 'and keep anothers' do
    fiat = Manufacturer.create!(name: 'Fiat')
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    cat_b = CarCategory.create!(name: 'b', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    c = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")
    c_b = CarModel.create!(name: 'Corolla', year:2019, manufacturer: toyota, motorization: "1.0", car_category: cat_b, fuel_type: "alcool")
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    subsidiary_b = Subsidiary.create!(name: 'Outra', cnpj: '14.380.277/0001-00', address: 'rua sem outro nome')
    car = Car.create!(license_plate:'ABC1234', color: "Branco", car_model: c, mileage: "0", subsidiary: subsidiary)
    car_b = Car.create!(license_plate:'ABC1235', color: "Preto", car_model: c_b, mileage: "45", subsidiary: subsidiary_b)
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Carros'
    click_on "details-#{car.id}"
    click_on 'Apagar carro'

    expect(page).not_to have_content('ABC1234')
    expect(page).not_to have_content('Branco')
    expect(page).not_to have_content('Uno')
    expect(page).not_to have_content('0')
    expect(page).not_to have_content('Nova')
    expect(page).to have_content('ABC1235')
    expect(page).to have_content('Preto')
    expect(page).to have_content('Corolla')
    expect(page).to have_content('45')
    expect(page).to have_content('Outra')
  end
end
