class AddSessionIdToDrivers < ActiveRecord::Migration
  def self.up
    add_column :drivers, :session_id, :string
  end

  def self.down
    remove_column :drivers, :session_id
  end
end
