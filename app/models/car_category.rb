class CarCategory < ApplicationRecord
  validates :name, :daily_rate , :car_insurance, :third_party_insurance, presence: {message: 'Você deve informar todos os dados correntamente'}
end
