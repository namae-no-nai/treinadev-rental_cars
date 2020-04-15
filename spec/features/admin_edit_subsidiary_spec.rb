require 'rails_helper'

feature 'User edits subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678999999', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Filial A'
    fill_in 'CNPJ', with: '12345678999999'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'
    
    click_on 'Enviar'

    expect(page).to have_content('Filial A')
    expect(page).to have_content('12345678999999')
    expect(page).to have_content('Rua Sem Nome, 00')
    expect(page).to have_link('Voltar')
  end

  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678999999', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end

  scenario 'unique Name' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678999999', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'outra', cnpj: '12345678999998', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'outra'
    fill_in 'CNPJ', with: '12345678999999'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content('Nome já cadastrado')
  end

  scenario 'unique CNPJ' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678999998', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'outra', cnpj: '12345678999999', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '12345678999999'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content('CNPJ já cadastrado')
  end

  scenario 'length' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678999998', address: 'rua sem nome, 00')


    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '123456789999991'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content('CNPJ deve conter 14 dígitos')
  end

  scenario 'numerical' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678999998', address: 'rua sem nome, 00')


    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '1234567899/9999'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content("CNPJ deve conter apenas números")
  end
end
