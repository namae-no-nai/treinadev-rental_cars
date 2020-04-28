class Client < ApplicationRecord
  validates :name, :document, :email, presence: true
  validates :document, :email, uniqueness: true
  validates :document, format: { with: /\A^\d{3}\.\d{3}\.\d{3}\-\d{2}$\z/, message: 'CPF incorreto' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email incorreto' } 
validate :document_must_be_valid

private
  
  def document_must_be_valid
    return if CPF.valid?(self.document)
    errors.add(:document, 'CPF não é válido')
  end
end