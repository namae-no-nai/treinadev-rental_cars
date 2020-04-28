require 'rails_helper'

describe Client, type: :model do
  context 'validation' do
    it 'cannot be blank' do
      client = Client.new

      client.valid?

      expect(client.errors[:name]).to include('não pode ficar em branco')
      expect(client.errors[:document]).to include('não pode ficar em branco')
      expect(client.errors[:email]).to include('não pode ficar em branco')
    end

    it 'must be uniq' do
      Client.create!(name: 'Qualquernome', document: '079.471.830-23', email: 'qualquer@algumacoisa.com')
      client = Client.new(name: 'Qualquernome', document: '079.471.830-23', email: 'qualquer@algumacoisa.com')

      client.valid?

      expect(client.errors[:document]).to include('já está em uso')
      expect(client.errors[:email]).to include('já está em uso')
    end

    it 'document must formated' do
      client = Client.new(name: 'Qualquernome', document: '07947183023', email: 'qualquer@algumacoisa.com')

      client.valid?

      expect(client.errors[:document]).to include('CPF incorreto')
    end

    it 'document must have only digits' do
      client = Client.new(name: 'Qualquernome', document: '079.471.830-27', email: 'qualquer@algumacoisa.com')

      client.valid?

      expect(client.errors[:document]).to include('CPF não é válido')
    end
    
    it 'must have this format' do
    client = Client.new(name: 'Qualquernome', document: '079.471.830-23', email: 'qualqueralgumacoisa.com')

    client.valid?

    expect(client.errors[:email]).to include('Email incorreto')
    end
  end
end
