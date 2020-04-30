require 'rails_helper'
# index, show, edit and new routes

#Manufacturer
#index
feature 'User access routes' do
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
   
    login_as user, scope: :user

    visit manufacturers_path

    expect(current_path).to eq manufacturers_path
  end
  scenario 'not logged in' do
    visit manufacturers_path

    expect(current_path).to eq user_session_path
  end
  #show
  scenario 'successfully' do
    toyota = Manufacturer.create!(name: "toyota")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
   
    login_as user, scope: :user

    visit manufacturer_path(toyota.id)

    expect(current_path).to eq manufacturer_path(toyota)
  end
  scenario 'not logged in' do
    toyota = Manufacturer.create!(name: "toyota")
    visit manufacturer_path(toyota.id)

    expect(current_path).to eq user_session_path
  end
  #show
  scenario 'successfully' do
    toyota = Manufacturer.create!(name: "toyota")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
   
    login_as user, scope: :user

    visit edit_manufacturer_path(toyota.id)

    expect(current_path).to eq edit_manufacturer_path(toyota)
  end
  scenario 'not logged in' do
    toyota = Manufacturer.create!(name: "toyota")
    visit edit_manufacturer_path(toyota.id)

    expect(current_path).to eq user_session_path
  end
  #new
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit new_manufacturer_path

    expect(current_path).to eq new_manufacturer_path
  end
  scenario 'not logged in' do
    visit new_manufacturer_path

    expect(current_path).to eq user_session_path
  end

  #Subsidiaries
  #index
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
   
    login_as user, scope: :user

    visit subsidiaries_path

    expect(current_path).to eq subsidiaries_path
  end
  scenario 'not logged in' do
    visit subsidiaries_path

    expect(current_path).to eq user_session_path
  end
   #show
   scenario 'successfully' do
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit subsidiary_path(subsidiary.id)

    expect(current_path).to eq subsidiary_path(subsidiary.id)
  end
  scenario 'not logged in' do
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    visit subsidiary_path(subsidiary.id)

    expect(current_path).to eq user_session_path
  end
  #edit
  scenario 'successfully' do
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit edit_subsidiary_path(subsidiary.id)

    expect(current_path).to eq edit_subsidiary_path(subsidiary.id)
  end
  scenario 'not logged in' do
    subsidiary = Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    visit edit_subsidiary_path(subsidiary.id)

    expect(current_path).to eq user_session_path
  end
  #new
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit new_subsidiary_path

    expect(current_path).to eq new_subsidiary_path
  end
  scenario 'not logged in' do
    visit new_subsidiary_path

    expect(current_path).to eq user_session_path
  end

  #car_category
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
   
    login_as user, scope: :user

    visit car_categories_path

    expect(current_path).to eq car_categories_path
  end
  scenario 'not logged in' do
    visit car_categories_path

    expect(current_path).to eq user_session_path
  end
  #show
  scenario 'successfully' do
    cat_a = CarCategory.create(name: 'A', daily_rate: '19.99', car_insurance: '22.39', third_party_insurance: '12.39')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit car_category_path(cat_a)

    expect(current_path).to eq car_category_path(cat_a)
  end
  scenario 'not logged in' do
    cat_a = CarCategory.create(name: 'A', daily_rate: '19.99', car_insurance: '22.39', third_party_insurance: '12.39')
    visit car_category_path(cat_a)

    expect(current_path).to eq user_session_path
  end
  #edit
  scenario 'successfully' do
    cat_a = CarCategory.create(name: 'A', daily_rate: '19.99', car_insurance: '22.39', third_party_insurance: '12.39')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')

    login_as user, scope: :user

    visit edit_car_category_path(cat_a)

    expect(current_path).to eq edit_car_category_path(cat_a)
  end
  scenario 'not logged in' do
    cat_a = CarCategory.create(name: 'A', daily_rate: '19.99', car_insurance: '22.39', third_party_insurance: '12.39')
    visit edit_car_category_path(cat_a)

    expect(current_path).to eq user_session_path  
  end
  #new
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit new_car_category_path

    expect(current_path).to eq new_car_category_path
  end
  scenario 'not logged in' do
    visit new_car_category_path

    expect(current_path).to eq user_session_path
  end

  #clients
  #index
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit clients_path

    expect(current_path).to eq clients_path
  end
  scenario 'not logged in' do
    visit clients_path

    expect(current_path).to eq user_session_path
  end
  #show
  scenario 'successfully' do
    client = Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit client_path(client.id)

    expect(current_path).to eq client_path(client.id)
  end
  scenario 'not logged in' do
  client = Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')

    visit client_path(client.id)

    expect(current_path).to eq user_session_path
  end
  #edit
  scenario 'successfully' do
    client = Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit edit_client_path(client.id)

    expect(current_path).to eq edit_client_path(client.id)
  end
  scenario 'not logged in' do
    client = Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')
    visit edit_client_path(client.id)

    expect(current_path).to eq user_session_path
  end  
  #new
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit new_client_path

    expect(current_path).to eq new_client_path
  end
  scenario 'not logged in' do
    visit new_client_path

    expect(current_path).to eq user_session_path
  end

  #car_model
  #index
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit car_models_path

    expect(current_path).to eq car_models_path
  end
  scenario 'not logged in' do
    visit car_models_path

    expect(current_path).to eq user_session_path
  end
  #show
  scenario 'successfully' do
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Ethios', year: 2020, manufacturer: toyota, 
                                 motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit car_model_path(car_model.id)

    expect(current_path).to eq car_model_path(car_model.id)
  end
  scenario 'not logged in' do
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Ethios', year: 2020, manufacturer: toyota, 
                                 motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    visit car_model_path(car_model.id)

    expect(current_path).to eq user_session_path
  end
  #edit
  scenario 'successfully' do
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Ethios', year: 2020, manufacturer: toyota, 
                                 motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit edit_car_model_path(car_model.id)

    expect(current_path).to eq edit_car_model_path(car_model.id)
  end
  scenario 'not logged in' do
    toyota = Manufacturer.create!(name: 'Toyota')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.create!(name:'Ethios', year: 2020, manufacturer: toyota, 
                                 motorization: "1.0", car_category: cat_a, fuel_type: "flex")
    visit edit_car_model_path(car_model.id)

    expect(current_path).to eq user_session_path
  end
  #new
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit new_car_model_path

    expect(current_path).to eq new_car_model_path
  end
  scenario 'not logged in' do
    visit new_car_model_path

    expect(current_path).to eq user_session_path
  end

  #rental
  #index
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit rentals_path

    expect(current_path).to eq rentals_path
  end
  scenario 'not logged in' do
    visit rentals_path

    expect(current_path).to eq user_session_path
  end
  #new
  scenario 'successfully' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    
    login_as user, scope: :user

    visit new_rental_path

    expect(current_path).to eq new_rental_path
  end
  scenario 'not logged in' do
    visit new_rental_path

    expect(current_path).to eq user_session_path
  end
end
