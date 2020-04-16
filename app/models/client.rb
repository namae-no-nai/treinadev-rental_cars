class Client < ApplicationRecord
  validates :name, presence: {message: 'Nome não pode ficar em branco'}
  validates :document, presence: {message: "CPF não pode ficar em branco"},
                       uniqueness: {message: 'CPF já cadastrado'}, 
                       length: {is: 11, message: 'CPF deve conter 11 dígitos'}, 
                       numericality: {only_integer: true, message: "CPF deve conter apenas números"}
  validates :email, presence: {message: 'Email não pode ficar em branco'},
                    uniqueness: {message: 'Email já cadastrado'},
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email incorreto' } 
  
end
