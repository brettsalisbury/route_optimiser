class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :id => :key do |t|
      t.string :key

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
