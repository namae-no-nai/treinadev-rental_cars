class Client < ApplicationRecord
  validates :name, :document, :email, presence: true
end
