require 'rails_helper'

feature  'User search rental' do
  scenario 'sucessfully' do
    cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
    car_insurance: "30.00", third_party_insurance: "30.00")
    client = Client.create!(name: 'Nome', document: '588.647.870-11', email: "algum@algumacoisa.com")
    rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.days.from_now, client: client, car_category: cat_b)
    other_rental = Rental.create!(start_date: 5.day.from_now, end_date: 7.days.from_now, client: client, car_category: cat_b)
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: rental.code
    click_on 'Buscar'

    expect(page).to have_content(rental.code)
    expect(page).to have_content(rental.client.name)
    expect(page).to have_content(rental.car_category.name)
    expect(page).not_to have_content(other_rental.code)
  end
  scenario 'cannot be blank' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: ""
    click_on 'Buscar'

    expect(page).to have_content("Nenhum resultado encontrado para:")
  end
  scenario 'and not found' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: "ABC123"
    click_on 'Buscar'

    expect(page).to have_content("Nenhum resultado encontrado para: ABC123")
  end
end