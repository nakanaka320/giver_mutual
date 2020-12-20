FactoryBot.define do
  factory :task do
    room
    member
    title {"プロダクトtest"}
    content {"コンテント"}
    start_at{"2020-10-07 10:00:00"}
    finish_at{"2020-12-08 10:00:00"}
    kind{0}
    finished{1}
    time_required{10}
  end
end