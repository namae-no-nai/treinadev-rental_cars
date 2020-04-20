require 'rails_helper'

feature 'Admin deletes client' do
  scenario 'successfully' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: "algum@algumacoisa.com")

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Apagar cliente'

    expect(current_path).to eq clients_path
    expect(page).to have_content('Nenhum cliente cadastrado')
  end

  scenario 'and keep anothers' do
    Client.create!(name: 'Algum nome', document: '12345678901', email: "algum@algumacoisa.com")
    Client.create!(name: 'Outro nome', document: '12345678902', email: "outro@algumacoisa.com")

    visit root_path
    click_on 'Clientes'
    click_on 'Algum nome'
    click_on 'Apagar cliente'

    expect(current_path).to eq clients_path
    expect(page).not_to have_content('Fiat')
    expect(page).not_to have_content('12345678901')
    expect(page).not_to have_content("algum@algumacoisa.com")
    expect(page).to have_content('Outro nome')
  end
end
