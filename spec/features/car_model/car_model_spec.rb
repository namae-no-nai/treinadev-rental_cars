require 'rails_helper'

describe CarModel, type: :model do
  context 'validation' do
    it 'cannot be blank' do
      car_model = CarModel.new

      car_model.valid?

      expect(car_model.errors[:name]).to include('não pode ficar em branco')
      expect(car_model.errors[:year]).to include('não pode ficar em branco')
      expect(car_model.errors[:motorization]).to include('não pode ficar em branco')
      expect(car_model.errors[:fuel_type]).to include('não pode ficar em branco')
    end
  end
end
