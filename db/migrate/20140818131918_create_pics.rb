class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :name
      t.references :flat, index: true

      t.timestamps
    end
  end
end
