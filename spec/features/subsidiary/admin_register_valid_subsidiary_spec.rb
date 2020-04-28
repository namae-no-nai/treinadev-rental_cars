require 'rails_helper'

feature 'Admin register valid subsidiary' do
  scenario 'and name must be unique' do
    Subsidiary.create(name: 'Nova', cnpj: '31.538.806/0001-61', address: "rua sem nome" )
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '31.538.806/0001-61'
    fill_in 'Endereço', with: 'rua sem nome'
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
    expect(page).to have_content('CNPJ já está em uso')
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
  scenario 'format' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '31.538.806/000161'
    fill_in 'Endereço', with: 'rua sem nome'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ incorreto')
  end
  scenario 'exist' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '31.538.806/0001-00'
    fill_in 'Endereço', with: 'rua sem nome'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ não é válido')
  end

end

