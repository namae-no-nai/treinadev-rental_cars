require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '12.345.678/9999-99', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '33.333.333/9999-99', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nova')
    expect(page).to have_content('Outra')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Nova', cnpj: '12.345.678/9999-99', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '33.333.333/9999-99', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'

    expect(page).to have_content('Nova')
    expect(page).to have_content('12.345.678/9999-99')
    expect(page).to have_content('rua sem nome, 00')
    expect(page).not_to have_content('Outra')
  end

  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Nova', cnpj: '12.345.678/9999-99', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '33.333.333/9999-99', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Nova', cnpj: '12.345.678/9999-99', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '33.333.333/9999-99', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
end
