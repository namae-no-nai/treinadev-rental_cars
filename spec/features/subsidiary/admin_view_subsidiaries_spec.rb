require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '91.298.062/0001-87', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '31.538.806/0001-61', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nova')
    expect(page).to have_content('Outra')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Nova', cnpj: '91.298.062/0001-87', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '31.538.806/0001-61', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'

    expect(page).to have_content('Nova')
    expect(page).to have_content('91.298.062/0001-87')
    expect(page).to have_content('rua sem nome, 00')
    expect(page).not_to have_content('Outra')
  end

  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Nova', cnpj: '91.298.062/0001-87', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '31.538.806/0001-61', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Nova', cnpj: '91.298.062/0001-87', address: 'rua sem nome, 00')
    Subsidiary.create!(name: 'Outra', cnpj: '31.538.806/0001-61', address: 'rua sem outro nome, 00')

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
end
