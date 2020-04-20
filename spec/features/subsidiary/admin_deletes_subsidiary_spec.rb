require 'rails_helper'

feature 'Admin deletes subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678901234', address: 'rua sem nome')

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Apagar filial'

    expect(current_path).to eq subsidiaries_path
    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and keep anothers' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678901234', address: 'rua sem nome')
    Subsidiary.create!(name: 'Outra', cnpj: '12345678901235', address: 'rua sem outro nome')

    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Apagar filial'

    expect(current_path).to eq subsidiaries_path
    expect(page).not_to have_content('Nova')
    expect(page).not_to have_content('12345678901234')
    expect(page).not_to have_content('rua sem nome')
    expect(page).to have_content('Outra')
  end
end
