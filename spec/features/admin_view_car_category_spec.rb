require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Carros cadastrados'

    expect(page).to have_content('utilitario')
    expect(page).to have_content('SUV')
  end

  scenario 'and view details' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Carros cadastrados'
    click_on 'utilitario'

    expect(page).to have_content('utilitario')
    expect(page).to have_content('12.10')
    expect(page).to have_content('32.99')
    expect(page).to have_content('54.33')
    expect(page).not_to have_content('SUV')
  end

  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Carros cadastrados'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Carros cadastrados'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Carros cadastrados'
    click_on 'utilitario'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
end
