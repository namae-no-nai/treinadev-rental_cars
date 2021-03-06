class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  
  validates :start_date, :end_date, presence: true
  
  before_create :generate_code
  
  private

  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase
  end

end
