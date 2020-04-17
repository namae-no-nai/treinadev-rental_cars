require 'rails_helper'

feature 'User register client' do
  scenario 'from index page' do
    visit root_path
    click_on 'Clientes'

    expect(page).to have_link('Cadastrar cliente', href: new_client_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar cliente'

    fill_in 'Nome', with: 'Alguém'
    fill_in 'CPF', with: '12345678999'
    fill_in 'Email', with: 'alguem@algumacoisa.com'
    click_on 'Enviar'

    expect(current_path).to eq client_path(Client.last.id)
    expect(page).to have_content('Alguém')
    expect(page).to have_content('12345678999')
    expect(page).to have_content('alguem@algumacoisa.com')
    expect(page).to have_link('Voltar')
  end
end
