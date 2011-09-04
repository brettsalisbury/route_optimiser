class Driver < ActiveRecord::Base
  attr_accessible :name, :address, :passenger_count, :session_id

  validates :name, :presence => true
  validates :address, :presence => true
  validates :passenger_count, :presence => true,
            :numericality => {:only_integer => true}
  validates :session_id, :presence => true

  #TODO Restrict searches by id, remove name uniqueness
end
