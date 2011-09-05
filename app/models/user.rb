class User < ActiveRecord::Base
  attr_accessible :key

  validates :key, :presence => true, :uniqueness => true
end
