require 'rails_helper'

describe Subsidiary, type: :model do
  context 'validation' do
    it 'cannot be blank' do
      subsidiary = Subsidiary.new

      subsidiary.valid?

      expect(subsidiary.errors[:name]).to include('Nome não pode ficar em branco')
      expect(subsidiary.errors[:address]).to include ('Endereço não pode ficar em branco')
      expect(subsidiary.errors[:cnpj]).to include ("CNPJ não pode ficar em branco")
    end

    it 'must be uniq' do
      Subsidiary.create!(name: 'Honda', cnpj: '91.298.062/0001-87', address:"rua qualquer")
      subsidiary = Subsidiary.new(name: 'Honda', cnpj: '91.298.062/0001-87', address: "rua qualquer")

      subsidiary.valid?

      expect(subsidiary.errors[:name]).to include('Nome já cadastrado')
      expect(subsidiary.errors[:cnpj]).to include ('CNPJ já cadastrado')
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
