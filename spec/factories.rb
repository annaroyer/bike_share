FactoryBot.define do
  factory :station do
    sequence(:name) { |n| "Station #{n}" }
    dock_count 25
    city 'San Francisco'
    installation_date Date.new(2013,8,20)
    latitude 	37.789756
    longitude (-122.39464299999999)
  end
end
