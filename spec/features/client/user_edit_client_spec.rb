require 'rails_helper'

feature 'User edits client' do
  scenario 'successfully' do
    Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'
    fill_in 'Nome', with: 'Outro nome'
    fill_in 'CPF', with: '079.471.830-23'
    fill_in 'Email', with: 'outracois@outracoisa.com'
    click_on 'Enviar'

    expect(page).to have_content('Outro nome')
    expect(page).to have_content('079.471.830-23')
    expect(page).to have_content('outracois@outracoisa.com')
  end

  scenario 'cant be blank' do
    Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')

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
    Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')
    Client.create!(name: 'Outro nome', document: '079.471.830-23', email: 'outracois@outracoisa.com')

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'
    fill_in 'Nome', with: 'Outro nome'
    fill_in 'CPF', with: '079.471.830-23'
    fill_in 'Email', with: 'outracois@outracoisa.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF já cadastrado')
    expect(page).to have_content('Email já cadastrado')
  end

  scenario 'format' do
    Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')
    
    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nome'
    fill_in 'CPF', with: '58864787011'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF incorreto')
  end

  scenario 'exist' do
    Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')
    
    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CPF', with: '588.647.870-19'
    fill_in 'Email', with: 'nome@eu.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF não é válido')
  end
  
  scenario 'email format' do
    Client.create!(name: 'Algum nome', document: '588.647.870-11', email: 'algumacois@outracoisa.com')
  
      visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova'
    fill_in 'CPF', with: '588.647.870-11'
    fill_in 'Email', with: 'nomeeu.com'
    click_on 'Enviar'

    expect(page).to have_content('Email incorreto')
  end  
end
