# == Schema Information
# Schema version: 20110724094941
#
# Table name: people
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  address         :string(255)
#  passenger_count :integer
#  type            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Person < ActiveRecord::Base
  attr_accessible :name, :address
  
  validates :name, :presence => true, 
                   :uniqueness => { :case_sensitive => false }
  validates :address, :presence => true
  validates :type, :presence => true
end
