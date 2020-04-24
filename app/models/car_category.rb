class CarCategory < ApplicationRecord
  has_many :car_models
  validates :name, presence: {message: 'Categoria não pode ficar em branco'},
                   uniqueness: {message: 'Categoria já cadastrada'}
  validates :daily_rate, presence: {message: 'Diária não pode ficar em branco'},
                          numericality: { greater_than: 0.00, message: "O valor da diária deve ser maior que 0.00" }
  validates :car_insurance, presence: {message: 'Seguro do carro não pode ficar em branco'},
                          numericality: { greater_than: 0.00, message: "O valor do seguro do carro deve ser maior que 0.00" }          
  validates :third_party_insurance, presence: {message: 'Seguro contra terceiros não pode ficar em branco'},
                          numericality: { greater_than: 0.00, message: "O valor do seguro contra teceiros deve ser maior que 0.00"}

end