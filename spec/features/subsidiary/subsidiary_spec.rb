require 'rails_helper'

describe Subsidiary, type: :model do
  context 'validation' do
    it 'cannot be blank' do
      subsidiary = Subsidiary.new

      subsidiary.valid?

      expect(subsidiary.errors[:name]).to include('não pode ficar em branco')
      expect(subsidiary.errors[:address]).to include ('não pode ficar em branco')
      expect(subsidiary.errors[:cnpj]).to include ("não pode ficar em branco")
    end

    it 'must be uniq' do
      Subsidiary.create!(name: 'Honda', cnpj: '91.298.062/0001-87', address:"rua qualquer")
      subsidiary = Subsidiary.new(name: 'Honda', cnpj: '91.298.062/0001-87', address: "rua qualquer")

      subsidiary.valid?

      expect(subsidiary.errors[:name]).to include('já está em uso')
      expect(subsidiary.errors[:cnpj]).to include ('já está em uso')
    end

    it 'must exist' do
      subsidiary = Subsidiary.new(name: 'Honda', cnpj: '91298062000132', address: "rua qualquer")
  
      subsidiary.valid?
      
      expect(subsidiary.errors[:cnpj]).to include('CNPJ incorreto')
    end

    it 'must exist' do
      subsidiary = Subsidiary.new(name: 'Honda', cnpj: '91.298.062/0001-32', address: "rua qualquer")
  
      subsidiary.valid?
      
      expect(subsidiary.errors[:cnpj]).to include('CNPJ não é válido')
    end
  end
end
