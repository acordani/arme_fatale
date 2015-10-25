class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.string :number
      t.integer :surface
      t.string :address
      t.string :neighborhood
      t.string :city

      t.timestamps null: false
    end
  end
end
