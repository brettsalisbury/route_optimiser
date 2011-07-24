class Driver < Person
  attr_accessible :passenger_count

  validates :passenger_count, :presence => true,
                              :numericality => { :only_integer => true }
end  
