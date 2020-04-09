require 'rails_helper'

feature 'Admin register car category' do
  scenario 'from index page' do
    visit root_path
    click_on 'Carros cadastrados'

    expect(page).to have_link('Cadastrar novo carro', href: new_car_category_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Carros cadastrados'
    click_on 'Cadastrar novo carro'

    fill_in 'Categoria', with: 'utilitário'
    fill_in 'Diária', with: '30.0'
    fill_in 'Seguro do carro', with: '50.0'
    fill_in 'Seguro contra terceiros', with: '75.52'
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('utilitário')
    expect(page).to have_content('30.0')
    expect(page).to have_content('50.0')
    expect(page).to have_content('75.52')
    expect(page).to have_link('Voltar')
  end
end
