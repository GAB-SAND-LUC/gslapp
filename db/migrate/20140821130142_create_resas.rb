class CreateResas < ActiveRecord::Migration
  def change
    create_table :resas do |t|
      t.text :message
      t.date :checkin
      t.date :checkout
      t.references :flat, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
