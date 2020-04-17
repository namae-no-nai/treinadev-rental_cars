require 'rails_helper'

feature 'Admin register valid subsidiary' do
  scenario 'and name must be unique' do
    Subsidiary.create(name: 'Nova', cnpj: '12345678901234', address: "rua sem nome" )
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '12345678901234'
    fill_in 'Endereço', with: 'rua sem nome'
    click_on 'Enviar'

    expect(page).to have_content('Nome já cadastrado')
    expect(page).to have_content('CNPJ já cadastrado')
  end

  scenario 'and can not be blank' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end
  scenario 'and must have 14' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '0123456789012345'
    fill_in 'Endereço', with: 'rua sem nome'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ deve conter 14 dígitos')
  end
  scenario 'only numebers' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '0123456789/2345'
    fill_in 'Endereço', with: 'rua sem nome'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ deve conter apenas números')
  end

end

