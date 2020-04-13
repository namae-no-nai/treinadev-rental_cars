class Manufacturer < ApplicationRecord
  validates :name, presence: {message: 'Você deve informar o fabricante'}
end
