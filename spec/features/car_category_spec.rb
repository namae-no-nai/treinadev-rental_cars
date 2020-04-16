require 'rails_helper'

describe CarCategory, type: :model do
  context 'validation' do
    it 'name cannot be blank' do
      car_category = CarCategory.new

      car_category.valid?

      expect(car_category.errors[:name]).to include('Nome não pode ficar em branco')
      expect(car_category.errors[:daily_rate]).to include('Seguro do carro não pode ficar em branco')
      expect(car_category.errors[:car_insurance]).to include('Seguro do Carro não pode ficar em branco')
      expect(car_category.errors[:third_party_insurance]).to include('Seguro contra terceiros não pode ficar em branco')
    end

    it 'name must be uniq' do
      CarCategory.create!(name: 'SUV', daily_rate: '19.99', car_insurance: '22.30', third_party_insurance: '12.30')
      car_category = CarCategory.new(name: 'SUV', daily_rate: '19.99', car_insurance: '22.30', third_party_insurance: '12.30')

      car_category.valid?

      expect(car_category.errors[:name]).to include('Nome deve ser único')
    end
  end
end
