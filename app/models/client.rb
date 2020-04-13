class Client < ApplicationRecord
  validates :name, :document, :email, presence:true
  validates :document, uniqueness: true, length: {is:11}, numericality: { only_integer: true }
end
