require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:task)).to be_valid
  end

  it "contentが空の場合にエラーになるのか" do
    expect(FactoryBot.build(:task, content: nil)).to be_valid
  end

  it "外部キーのroom_idが空の場合にエラーになるのか" do
    expect(FactoryBot.build(:task, room_id: nil)).to_not be_valid
  end
  
  it "外部キーのmember_idが空の場合にエラーになるのか" do
    expect(FactoryBot.build(:task, member_id: nil)).to_not be_valid
  end

  it "time_requiredがない場合にタスクを登録できない" do
    expect(FactoryBot.build(:task, time_required: nil)).to_not be_valid
  end

end
