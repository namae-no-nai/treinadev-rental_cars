require 'rails_helper'

feature 'Admin register rental' do
  scenario 'successfully' do
  CarCategory.create!(name: 'A', daily_rate: "40.00", 
                             car_insurance: "30.00", third_party_insurance: "30.00")
  Client.create!(name: 'Nome', document: '588.647.870-11', email: "algum@algumacoisa.com")
  user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
  login_as user, scope: :user

    visit root_path

    click_on 'Locações'
    click_on 'Registrar locação'

    fill_in 'Data inicial', with: '10/10/2020'
    fill_in 'Data de término', with: '10/11/2020'
    select 'Nome', from: 'Cliente'
    select 'A', from: 'Categoria'
    click_on "Enviar"

    expect(page).to have_content('10/10/2020')
    expect(page).to have_content('10/11/2020')
    expect(page).to have_content('Nome')
    expect(page).to have_content('A')
    expect(page).to have_content('Voltar')
  end
  
  scenario 'and must fill all fields' do
    CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    Client.create!(name: 'Nome', document: '588.647.870-11', email: "algum@algumacoisa.com")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
      
    login_as user, scope: :user

    visit root_path

    click_on 'Locações'
    click_on 'Registrar locação'

    fill_in 'Data inicial', with: ''
    fill_in 'Data de término', with: ''
    select 'Nome', from: 'Cliente'
    select 'A', from: 'Categoria'
    click_on "Enviar"

    expect(page).to have_content('Data inicial não pode ficar em branco')
    expect(page).to have_content('Data de término não pode ficar em branco')
  end
end