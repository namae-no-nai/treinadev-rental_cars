require 'rails_helper'

feature 'User update subsidiary' do
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

  scenario 'and must fill in all fields' do
    Subsidiary.create!(name: 'Nova', cnpj: '12345678999999', address: 'rua sem nome, 00')

    # simula a ação do usuário
    visit root_path
    click_on 'Filiais'
    click_on 'Nova'
    click_on 'Editar'

    fill_in 'CNPJ', with: '12345678999999'
    fill_in 'Endereço', with: ""
    
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar todos os dados')
  end
end
