class Subsidiary < ApplicationRecord
  validates :name, :cnpj, :address, presence: true
  validates :cnpj, uniqueness: true, length: {is: 14}, numericality: { only_integer: true}
end
