require 'rails_helper'
# index and new routes

# manufacturer
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
  #subsidiaries
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
