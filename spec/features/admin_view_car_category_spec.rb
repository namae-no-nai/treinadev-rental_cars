require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_content('utilitário')
    expect(page).to have_content('SUV')
  end

  scenario 'and view details' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Categorias de carros'
    click_on 'utilitário'

    expect(page).to have_content('utilitário')
    expect(page).to have_content('12.1')
    expect(page).to have_content('32.99')
    expect(page).to have_content('54.33')
    expect(page).not_to have_content('SUV')
  end

  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_content('Nenhum carro cadastrado')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Categorias de carros'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')

    visit root_path
    click_on 'Categorias de carros'
    click_on 'utilitário'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end
