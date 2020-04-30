require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_content('utilitário')
    expect(page).to have_content('SUV')
  end

  scenario 'and view details' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'utilitário'

    expect(page).to have_content('utilitário')
    expect(page).to have_content('12,10')
    expect(page).to have_content('32,99')
    expect(page).to have_content('54,33')
    expect(page).not_to have_content('SUV')
  end

  scenario 'and no subsidiaries are created' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_content('Nenhuma categoria de carro cadastrada')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    CarCategory.create!(name: 'utilitário', daily_rate: '12.10', car_insurance: '32.99', third_party_insurance: '54.33')
    CarCategory.create!(name: 'SUV',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on 'Categorias de carros'
    click_on 'utilitário'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end

  scenario 'view all cars' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A',  daily_rate: '12.22', car_insurance: '15.99', third_party_insurance: '33.33')
    uno = CarModel.create!(name:'Uno', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    mobi = CarModel.create!(name:'Mobi', year: 2020, manufacturer: fiat, motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit root_path
    click_on "Categorias de carros"
    click_on "A"

    expect(page).to have_content('Categoria: A')
    expect(page).to have_content('12,22')
    expect(page).to have_content('15,99')
    expect(page).to have_content('33,33')
    expect(page).to have_link('Uno', href: car_model_path(uno))
    expect(page).to have_link('Mobi', href: car_model_path(mobi))
    expect(page).to have_link('Voltar', href: car_categories_path)

  end
end
