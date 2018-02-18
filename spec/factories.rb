FactoryBot.define do
  factory :trip do
    duration 10
    start_date Time.now
    start_station_id 55
    end_date Time.now
    end_station_id 56
    sequence(:bike_id) { |n| n }
    subscription_type "Subscriber"
    zip_code 94965
  end
end
