class Driver < ActiveRecord::Base
  attr_accessible :name, :address, :passenger_count, :session_id

  validates :name, :presence => true,
            :uniqueness => {:case_sensitive => false}
  validates :address, :presence => true
  validates :passenger_count, :presence => true,
            :numericality => {:only_integer => true}
  validates :session_id, :presence => true
end
