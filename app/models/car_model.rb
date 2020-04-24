class CarModel < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :car_category

validates :name, presence: {message: "Nome não pode ficar em branco"}
validates :year, presence: {message: "Ano não pode ficar em branco"},
                length: {is:4, message: "Ano deve ser no formato NNNN"},
                numericality: {only_integer: true, message: "Ano deve conter apenas números"}
validates :motorization, presence: {message: "Cavalos não pode ficar em branco"}
validates :fuel_type, presence: {message: "Tipo de combustível não pode ficar em branco"}
end
