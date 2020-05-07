require 'rails_helper'

feature "User start rental" do
  xscenario "sucessfully" do
    manufacturer = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Uno', year: 2020, manufacturer: manufacturer, motorization: "2.0", car_category: cat_a, fuel_type: "flex")
    car = Car.create!(license_plate: 'ABC1234', color: 'Branco', car_model: car_model, milage: 0)
    client = Client.create!(name: 'Nome', document: '588.647.870-11', email: "algum@algumacoisa.com")
    rental = Rental.create!(start_date: "11/11/2200", end_date: "15/11/2200", client: client, car_category: cat_a)
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user
    visit search_rentals_path(q: rental.code)
    click_on 'Iniciar'
    select car.license_plate, from:'Carro'
    click_on 'Confirmar locação'
    
    expect(page).to have_content(I18n.l(Time.zone.now, format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(client.name)
    expect(page).to have_content(client.email)
    expect(page).to have_content(user.email)
  end
end