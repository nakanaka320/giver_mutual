rooms = %w("整形", "脳血管", "内部", "地域包括", "急性期OT", "回復期OT", "急性期ST", "回復期ST", "急性期PT", "回復期PT", "管理者")

0.upto(10) do |idx|
  Room.create(
    name: rooms[idx]
  )
end