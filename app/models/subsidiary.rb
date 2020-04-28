class Subsidiary < ApplicationRecord
  validates :name, :address, :cnpj, presence: true
  validates :name, :cnpj, uniqueness: true
  validates :cnpj, format: { with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/, message: 'CNPJ incorreto' }
  validate :cnpj_must_be_valid

private
  
  def cnpj_must_be_valid
    return if CNPJ.valid?(self.cnpj)
    errors.add(:cnpj, 'CNPJ não é válido')
  end
end
