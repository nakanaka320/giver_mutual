json.user_name @message.member.user_name
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @message.content