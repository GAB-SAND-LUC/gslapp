class AddStateToResas < ActiveRecord::Migration
  def self.up
    add_column :resas, :state, :string
  end

  def self.down
    remove_column :resas, :state
  end
end
