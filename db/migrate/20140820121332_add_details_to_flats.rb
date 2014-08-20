class AddDetailsToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :city, :string
    add_column :flats, :zip_code, :integer
  end
end
