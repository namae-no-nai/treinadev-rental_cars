require 'rails_helper'

feature 'Admin register valid manufacturer' do
  scenario 'and name must be unique' do
    Manufacturer.create(name: 'Fiat' )
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end

  scenario 'and name can not be blank' do
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar fabricante'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end

end

