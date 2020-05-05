require 'rails_helper'

RSpec.describe Rental, type: :model do
  it 'should generate a code upon create' do
    cat_b = CarCategory.create!(name: 'B', daily_rate: "40.00", 
    car_insurance: "30.00", third_party_insurance: "30.00")
    client = Client.create!(name: 'Nome', document: '588.647.870-11', email: "algum@algumacoisa.com")
    rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.days.from_now, client: client, car_category: cat_b)

    rental.save

    expect(rental.code).not_to be_blank
  end
end
