namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Driver.create!(:name => "Example User",
                   :address => "115 Pacific Highway, North Sydney",
                   :passenger_count => 4
    )
    10.times do |n|
      name = Faker::Name.name
      address = Faker::Address.street_address
      passenger_count = Random.rand(6)
      Driver.create!(:name => name,
                     :address => address,
                     :passenger_count => passenger_count
      )
    end
  end
end