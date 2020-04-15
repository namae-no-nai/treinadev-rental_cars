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
      Subsidiary.create!(name: 'Honda', cnpj: '12345678901234', address:"rua qualquer")
      subsidiary = Subsidiary.new(name: 'Honda', cnpj: '12345678901234', address: "rua qualquer")

      subsidiary.valid?

      expect(subsidiary.errors[:name]).to include('Nome já cadastrado')
      expect(subsidiary.errors[:cnpj]).to include ('CNPJ já cadastrado')
    end
  end
end
