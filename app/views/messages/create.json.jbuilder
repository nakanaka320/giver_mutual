json.array! @messages do |message|
  json.member message.member
  json.created_at message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.content message.content
end