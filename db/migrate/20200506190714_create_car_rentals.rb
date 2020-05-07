class CreateCarRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :car_rentals do |t|
      t.belongs_to :car, foreign_key: true
      t.belongs_to :rental, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
