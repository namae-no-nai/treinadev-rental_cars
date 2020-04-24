require 'rails_helper'

feature 'Admin deletes car_catergory' do
  scenario 'successfully' do
    CarCategory.create!(name: 'SUV', daily_rate: '19.99', car_insurance: '10.00', third_party_insurance: "12.99")

    visit root_path
    click_on 'Categorias de carros'
    click_on 'SUV'
    click_on 'Apagar categoria'

    expect(current_path).to eq car_categories_path
    expect(page).to have_content('Nenhuma categoria de carro cadastrada')
  end

  scenario 'and keep anothers' do
    CarCategory.create!(name: 'SUV', daily_rate: '19.99', car_insurance: '10.00', third_party_insurance: "12.99")
    CarCategory.create!(name: 'compacto', daily_rate: '20.12', car_insurance: '15.00', third_party_insurance: "19.00")

    visit root_path
    click_on 'Categorias de carros'
    click_on 'SUV'
    click_on 'Apagar categoria'

    expect(current_path).to eq car_categories_path
    expect(page).not_to have_content('SUV')
    expect(page).not_to have_content('19.99')
    expect(page).not_to have_content('10.00')
    expect(page).not_to have_content('12.99')
    expect(page).to have_content('compacto')
  end
end
