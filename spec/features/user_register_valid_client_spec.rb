require 'rails_helper'

feature 'User register valid client' do
  scenario 'and must be unique' do
    Client.create(name: 'Nome', document: '12345678901', email: 'eu@algumacoisa.com')
    Client.create(name: 'Outro nome', document: '12345678901', email: 'eu@algumacoisa.com')

    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Nome'
    fill_in 'CPF', with: '12345678901'
    fill_in 'Email', with: 'eu@algumacoisa.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF já cadastrado')
    expect(page).to have_content('Email já cadastrado')
  end

  scenario 'and can not be blank' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Email', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
  end

  scenario 'and must have 11' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Nome'
    fill_in 'CPF', with: '0123456789012345'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF deve conter 11 dígitos')
  end
 
  scenario 'only numbers' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CPF', with: '0123456789/2'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF deve conter apenas números')
  end

  scenario 'email format' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CPF', with: '012345678901'
    fill_in 'Email', with: 'nomeeu.com'
    click_on 'Enviar'

    expect(page).to have_content('Email incorreto')
  end
end

