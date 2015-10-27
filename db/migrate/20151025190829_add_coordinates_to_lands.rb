class AddCoordinatesToLands < ActiveRecord::Migration
  def change
    add_column :lands, :latitude, :float
    add_column :lands, :longitude, :float
  end
end
