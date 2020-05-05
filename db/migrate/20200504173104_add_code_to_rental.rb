class AddCodeToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :code, :string
  end
end
