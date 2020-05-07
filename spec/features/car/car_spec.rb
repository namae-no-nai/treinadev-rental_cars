require 'rails_helper'

describe CarModel, type: :model do
  context 'validation' do
    it 'cannot be blank' do
      car = Car.new

      car.valid?

      expect(car.errors[:license_plate]).to include('não pode ficar em branco')
      expect(car.errors[:color]).to include('não pode ficar em branco')
      expect(car.errors[:mileage]).to include('não pode ficar em branco')
    end
  end
end
