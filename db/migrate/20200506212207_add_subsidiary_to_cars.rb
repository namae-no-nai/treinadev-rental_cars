class AddSubsidiaryToCars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :subsidiary, foreign_key: true
  end
end
