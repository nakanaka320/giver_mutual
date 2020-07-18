rooms = %w("整形", "脳血管", "内部", "地域包括", "急性期OT", "回復期OT", "急性期ST", "回復期ST", "回復期A", "回復期B", "管理者")

0.upto(10) do |idx|
  Room.create(
    name: rooms[idx]
  )
end