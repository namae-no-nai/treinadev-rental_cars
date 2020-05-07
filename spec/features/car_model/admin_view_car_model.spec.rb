require 'rails_helper'

feature 'Admin view car models' do
  scenario 'sucessfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    ford = Manufacturer.create!(name: 'Ford')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", car_insurance: "30.00", third_party_insurance: "30.00")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    #Arrange
    CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")
    CarModel.create!(name:'Ka', year: 2021, manufacturer: ford, motorization: "2.0", car_category: cat_a, fuel_type: "flex")
    #Act
    visit root_path
    click_on 'Modelos de carros'
    #Assert
    
    expect(page).to have_content('Fiat')
    expect(page).to have_content('Uno')
    expect(page).to have_content('2020')

    expect(page).to have_content('Ford')
    expect(page).to have_content('Ka')
    expect(page).to have_content('2021')
  end 

    scenario 'and view details' do

    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    c = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Modelos de carros'
    click_on "details-#{c.id}"

    expect(page).to have_content('Uno')
    expect(page).to have_content('Fiat')
    expect(page).to have_content('2020')
    expect(page).to have_content('2.0')
    expect(page).to have_content('A')
    expect(page).to have_content('flex')
    expect(page).to have_content('40.00')
  end
end