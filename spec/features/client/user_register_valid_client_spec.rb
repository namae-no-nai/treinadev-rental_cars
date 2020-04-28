require 'rails_helper'

feature 'User register valid client' do
  scenario 'and must be unique' do
    Client.create(name: 'Nome', document: '892.317.680-00', email: 'eu@algumacoisa.com')
   
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Nome'
    fill_in 'CPF', with: '892.317.680-00'
    fill_in 'Email', with: 'eu@algumacoisa.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF já está em uso')
    expect(page).to have_content('Email já está em uso')
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

  scenario 'incorret' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Nome'
    fill_in 'CPF', with: '43481057075'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF incorreto')
  end
 
  scenario 'exist' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CPF', with: '999.999.999-99'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF não é válido')
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

