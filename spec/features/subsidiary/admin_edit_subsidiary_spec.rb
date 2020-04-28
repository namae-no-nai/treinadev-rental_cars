require 'rails_helper'

feature 'User edits subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Filial A'
    fill_in 'CNPJ', with: '31.538.806/0001-61'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'
    
    click_on 'Enviar'

    expect(page).to have_content('Filial A')
    expect(page).to have_content('31.538.806/0001-61')
    expect(page).to have_content('Rua Sem Nome, 00')
    expect(page).to have_link('Voltar')
  end

  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')

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
    Subsidiary.create!(name: 'Nova', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'outra', cnpj: '14.380.277/0001-00', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'outra'
    fill_in 'CNPJ', with: '12345678999999'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end

  scenario 'unique CNPJ' do
    Subsidiary.create!(name: 'Nova', cnpj: '14.380.277/0001-00', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'outra', cnpj: '31.538.806/0001-61', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '31.538.806/0001-61'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content('CNPJ já está em uso')
  end

  scenario 'format' do
    Subsidiary.create!(name: 'Nova', cnpj: '14.380.277/0001-00', address: 'rua sem nome, 00')


    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '14380277000100'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content('CNPJ incorreto')
  end

  scenario 'exist' do
    Subsidiary.create!(name: 'Nova', cnpj: '14.380.277/0001-00', address: 'rua sem nome, 00')


    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CNPJ', with: '14.380.277/0001-11'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'

    click_on 'Enviar'

    expect(page).to have_content("CNPJ não é válido")
  end
end
