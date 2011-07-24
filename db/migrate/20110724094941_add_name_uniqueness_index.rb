class AddNameUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :people, :name, :unique => true
  end

  def self.down
    remove_index :people, :name
  end
end
