class Subsidiary < ApplicationRecord
  validates :name, presence: {message: 'Nome não pode ficar em branco'},
                   uniqueness: {message: 'Nome já cadastrado'}
  validates :address, presence: {message: 'Endereço não pode ficar em branco'}
  validates :cnpj, presence: {message: "CNPJ não pode ficar em branco"},
                   uniqueness: {message: 'CNPJ já cadastrado'},
                   format: { with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/, message: 'CNPJ incorreto' }
  validate :cnpj_must_be_valid

private
  
  def cnpj_must_be_valid
    return if CNPJ.valid?(self.cnpj)
    errors.add(:cnpj, 'CNPJ não é válido')
  end
end
