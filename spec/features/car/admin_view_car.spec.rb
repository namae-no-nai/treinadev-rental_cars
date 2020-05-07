require 'rails_helper'

feature 'Admin view car' do
  scenario 'sucessfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    car = Car.create!(license_plate:'ABC1234', color: "Branco", car_model: car_model, mileage: "0", subsidiary: subsidiary)

    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    #Arrange
    
    #Act
    visit root_path
    click_on 'Carros'
    #Assert
    
    expect(page).to have_content('ABC1234')
    expect(page).to have_content('Branco')
    expect(page).to have_content('Uno')
    expect(page).to have_content('0')
    expect(page).to have_content('Nova')

  end 
end