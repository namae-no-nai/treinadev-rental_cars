require 'rails_helper'

describe Client, type: :model do
  context 'validation' do
    it 'cannot be blank' do
      client = Client.new

      client.valid?

      expect(client.errors[:name]).to include('Nome não pode ficar em branco')
      expect(client.errors[:document]).to include('CPF não pode ficar em branco')
      expect(client.errors[:email]).to include('Email não pode ficar em branco')
    end

    it 'must be uniq' do
      Client.create!(name: 'Qualquernome', document: 12345678901, email: 'qualquer@algumacoisa.com')
      client = Client.new(name: 'Qualquernome', document: 12345678901, email: 'qualquer@algumacoisa.com')

      client.valid?

      expect(client.errors[:document]).to include('CPF já cadastrado')
      expect(client.errors[:email]).to include('Email já cadastrado')
    end

    it 'document must be 11 digits long' do
      client = Client.new(name: 'Qualquernome', document: 123456789012, email: 'qualquer@algumacoisa.com')

      client.valid?

      expect(client.errors[:document]).to include('CPF deve conter 11 dígitos')
    end

    it 'document must have only digits' do
      client = Client.new(name: 'Qualquernome', document: '123456789/0', email: 'qualquer@algumacoisa.com')

      client.valid?

      expect(client.errors[:document]).to include('CPF deve conter apenas números')
    end
    
    it 'must have this format' do
    client = Client.new(name: 'Qualquernome', document: '123456789012', email: 'qualqueralgumacoisa.com')

    client.valid?

    expect(client.errors[:email]).to include('Email incorreto')
    end
  end
end
