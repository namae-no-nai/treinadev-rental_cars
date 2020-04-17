class CarCategory < ApplicationRecord
  validates :name, presence: {message: 'Categoria não pode ficar em branco'},
                   uniqueness: {message: 'Categoria já cadastrada'}
  validates :daily_rate, presence: {message: 'Diária não pode ficar em branco'}
                        # format: { with: /[0-9]+\.[0-9]{2}/, message: 'Deve conter um valor em reais' }
  validates :car_insurance, presence: {message: 'Seguro do carro não pode ficar em branco'}
                         #format: { with: /[0-9]+\.[0-9]{2}/, message: 'Deve conter um valor em reais' }
  validates :third_party_insurance, presence: {message: 'Seguro contra terceiros não pode ficar em branco'}
                        # format: { with: /[0-9]+\.[0-9]{2}/, message: 'Deve conter um valor em reais' }
end