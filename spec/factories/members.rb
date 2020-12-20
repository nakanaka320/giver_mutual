FactoryBot.define do
  factory :member do
    room
    user_name { "中光夫" }
    sequence(:email) { |n| "nakanaka@gmail.com" }
    password {"nakanaka"}
    administrator {false}
    room_id {1}
    end
end