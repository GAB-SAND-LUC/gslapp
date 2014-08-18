class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :address
      t.string :surface
      t.text :description
      t.integer :beds
      t.integer :price

      t.timestamps
    end
  end
end
