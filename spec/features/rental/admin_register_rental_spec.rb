require 'rails_helper'

feature 'Admin register rental' do
  scenario 'successfully' do
   CarCategory.create!(name: 'A', daily_rate: "40.00", 
                             car_insurance: "30.00", third_party_insurance: "30.00")
  Client.create!(name: 'Nome', document: '588.647.870-11', email: "algum@algumacoisa.com")
  
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
end