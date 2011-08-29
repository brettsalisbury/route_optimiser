class AddNameUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :drivers, :name, :unique => true
  end

  def self.down
    remove_index :drivers, :name
  end
end
