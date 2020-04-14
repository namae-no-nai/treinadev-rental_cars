class Subsidiary < ApplicationRecord
  validates :name, :cnpj, :address, presence: {message: 'Você deve informar todos os dados'}
  validates :cnpj, uniqueness: true, length: {is: 14}, numericality: {only_integer: true}
end
