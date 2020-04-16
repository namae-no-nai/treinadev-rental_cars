require 'rails_helper'

feature 'User edits client' do
  scenario 'successfully' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: 'algumacois@outracoisa.com')

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'
    fill_in 'Nome', with: 'Outro nome'
    fill_in 'CPF', with: '33333333999'
    fill_in 'Email', with: 'outracois@outracoisa.com'
    click_on 'Enviar'

    expect(page).to have_content('Outro nome')
    expect(page).to have_content('33333333999')
    expect(page).to have_content('outracois@outracoisa.com')
  end

  scenario 'cant be blank' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: 'algumacois@outracoisa.com')

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Email', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
  end

  scenario 'must be unique' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: 'algumacois@outracoisa.com')
    Client.create!(name: 'Outro nome', document: '33333333999', email: 'outracois@outracoisa.com')

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'
    fill_in 'Nome', with: 'Outro nome'
    fill_in 'CPF', with: '33333333999'
    fill_in 'Email', with: 'outracois@outracoisa.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF já cadastrado')
    expect(page).to have_content('Email já cadastrado')
  end

  scenario 'and must have 11' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: 'algumacois@outracoisa.com')
    
    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nome'
    fill_in 'CPF', with: '0123456789012345'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF deve conter 11 dígitos')
  end

  scenario 'only numbers' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: 'algumacois@outracoisa.com')
    
    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CPF', with: '0123456789/2'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF deve conter apenas números')
  end
  
  scenario 'email format' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: 'algumacois@outracoisa.com')
  
      visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CPF', with: '012345678901'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('Email inválido')
  end  
end
