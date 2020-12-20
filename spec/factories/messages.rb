FactoryBot.define do
  factory :message do
    room
    member
    content {"代行をお願いします"}
    # room_id {1}
    # member_id {1}
  end
end
