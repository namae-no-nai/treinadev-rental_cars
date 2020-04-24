class AddFieldsToCarModel < ActiveRecord::Migration[5.2]
  def change
    add_column :car_models, :motorization, :string
    add_column :car_models, :fuel_type, :string
    add_reference :car_models, :car_category, foreign_key: true
  end
end
