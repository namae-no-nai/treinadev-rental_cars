require 'rails_helper'

describe CarModel, type: :model do
  context 'validation' do
    it 'cannot be blank' do
      car_model = CarModel.new

      car_model.valid?

      expect(car_model.errors[:name]).to include('Nome não pode ficar em branco')
      expect(car_model.errors[:year]).to include('Ano não pode ficar em branco')
      expect(car_model.errors[:motorization]).to include('Cavalos não pode ficar em branco')
      expect(car_model.errors[:fuel_type]).to include('Tipo de combustível não pode ficar em branco')
    end

    it 'ano must formated' do
      fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.new(name:'Uno', year: 20, manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")

      car_model.valid?

      expect(car_model.errors[:year]).to include( "Ano deve ser no formato NNNN")
    end

    it 'document must have only digits' do
      fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: "40.00", 
                                car_insurance: "30.00", third_party_insurance: "30.00")
    car_model = CarModel.new(name:'Uno', year: "2O2I", manufacturer: fiat, motorization: "2.0", car_category: cat_a, fuel_type: "flex")

      car_model.valid?

      expect(car_model.errors[:year]).to include("Ano deve conter apenas números")
    end
  end
end
