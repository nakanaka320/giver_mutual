require 'rails_helper'

RSpec.describe Message, type: :model do
  
  # 11/24日　OK
  it "メッセージを作ることができるのか" do
    expect(FactoryBot.build(:message)).to be_valid
  end

  # 11/24日　OK
  it "messageが空の場合にエラーになるのか" do
    expect(FactoryBot.build(:message, content: nil)).to_not be_valid
  end

  it "外部キーのroom_idが空の場合にエラーになるのか" do
    expect(FactoryBot.build(:message, room_id: nil)).to_not be_valid
  end

  it "外部キーのmember_idが空の場合にエラーになるのか" do
    expect(FactoryBot.build(:message, member_id: nil)).to_not be_valid
  end

end