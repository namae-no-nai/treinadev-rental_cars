require 'rails_helper'

feature 'Admin edits car' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    car = Car.create!(license_plate:'ABC1234', color: "Branco", car_model: car_model, mileage: "0", subsidiary: subsidiary)
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Carros'
    click_on "details-#{car.id}"
    click_on 'Editar'

    fill_in 'Placa', with: 'ABC1235'
    fill_in 'Cor', with: 'Preto'
    select 'Uno', from:  'Modelo do carro'
    fill_in 'Kilometragem', with: '100'
    select 'Nova', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content 'ABC1235'
    expect(page).to have_content 'Preto'
    expect(page).to have_content 'Uno'
    expect(page).to have_content '100'
    expect(page).to have_content 'Nova'
  end

  scenario 'cant be blank' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    car = Car.create!(license_plate:'ABC1234', color: "Branco", car_model: car_model, mileage: "0", subsidiary: subsidiary)
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user


    visit root_path
    click_on 'Carros'
    click_on "details-#{car.id}"
    click_on 'Editar'

    fill_in 'Placa', with: ''
    fill_in 'Cor', with: ''
    select 'Uno', from:  'Modelo do carro'
    fill_in 'Kilometragem', with: ''
    select 'Nova', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content("Placa não pode ficar em branco")
    expect(page).to have_content("Cor não pode ficar em branco")
    expect(page).to have_content("Kilometragem não pode ficar em branco")
  end 
  scenario 'must be uniq' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    car = Car.create!(license_plate:'ABC1234', color: "Branco", car_model: car_model, mileage: "0", subsidiary: subsidiary)
    car_b = Car.create!(license_plate:'ABC1235', color: "Branco", car_model: car_model, mileage: "0", subsidiary: subsidiary)
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')

    login_as user, scope: :user


    visit root_path
    click_on 'Carros'
    click_on "details-#{car.id}"
    click_on 'Editar'

    fill_in 'Placa', with: 'ABC1235'
    fill_in 'Cor', with: 'Preto'
    select 'Uno', from:  'Modelo do carro'
    fill_in 'Kilometragem', with: '100'
    select 'Nova', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content("Placa já está em uso")
  end
end
