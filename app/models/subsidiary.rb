class Subsidiary < ApplicationRecord
  validates :name, :cnpj, :address, presence: {message: 'Você deve informar todos os dados'}
  validates :cnpj, uniqueness: {message: 'CNPJ já cadastrado'}, length: {is: 14, message: 'Tamanho errado'}, 
                                numericality: {only_integer: {message: "CNPJ deve conter apenas números"}}
end
