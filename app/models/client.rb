class Client < ApplicationRecord
  validates :name, presence: {message: 'Nome não pode ficar em branco'}
  validates :document, presence: {message: "CPF não pode ficar em branco"},
                       uniqueness: {message: 'CPF já cadastrado'}, 
                       format: { with: /\A^\d{3}\.\d{3}\.\d{3}\-\d{2}$\z/, message: 'CPF incorreto' }
  validates :email, presence: {message: 'Email não pode ficar em branco'},
                    uniqueness: {message: 'Email já cadastrado'},
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email incorreto' } 
validate :document_must_be_valid

private
  
  def document_must_be_valid
    return if CPF.valid?(self.document)
    errors.add(:document, 'CPF não é válido')
  end
end