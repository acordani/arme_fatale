class AddFileToLands < ActiveRecord::Migration
  def change
    add_column :lands, :file, :string
  end
end
