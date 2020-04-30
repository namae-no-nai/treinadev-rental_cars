require 'rails_helper'

feature 'User view rental' do
  scenario 'successfully' do
  cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
  car_insurance: "30.00", third_party_insurance: "30.00")
  client = Client.create!(name: 'Nome', document: '588.647.870-11', email: "algum@algumacoisa.com")
  Rental.create!(start_date: "11/11/2200", end_date: "15/11/2200", client: client, car_category: cat_b)
  user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
  login_as user, scope: :user
  
  visit root_path
  click_on 'Locações'
  
  expect(page).to have_content('11/11/2200')
  expect(page).to have_content('15/11/2200')
  expect(page).to have_content('Nome')
  expect(page).to have_content('B')
  end
  scenario 'unless logged in' do
    visit root_path

    expect(page).not_to have_link('Locações')
  end
end
