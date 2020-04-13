require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Filial A'
    fill_in 'CNPJ', with: '12345678999999'
    fill_in 'Endereço', with: 'Rua Sem Nome, 00'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Filial A')
    expect(page).to have_content('12345678999999')
    expect(page).to have_content('Rua Sem Nome, 00')
    expect(page).to have_link('Voltar')
  end
end
