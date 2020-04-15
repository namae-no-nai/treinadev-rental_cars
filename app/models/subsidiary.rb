class Subsidiary < ApplicationRecord
  validates :name, presence: {message: 'Nome não pode ficar em branco'},
                   uniqueness: {message: 'Nome já cadastrado'}
  validates :address, presence: {message: 'Endereço não pode ficar em branco'}
  validates :cnpj, presence: {message: "CNPJ não pode ficar em branco"},
                   uniqueness: {message: 'CNPJ já cadastrado'}, 
                   length: {is: 14, message: 'CNPJ deve conter 14 dígitos'}, 
                   numericality: {only_integer: true, message: "CNPJ deve conter apenas números"}
end
