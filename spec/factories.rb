require 'factory_girl'
# By using the symbol ':driver', we get Factory Girl to simulate the Driver model

Factory.define :driver do |driver|
  driver.name "Brandon Stark"
  driver.address "118 Castlereagh St, Sydney NSW"
  driver.passenger_count 5
end