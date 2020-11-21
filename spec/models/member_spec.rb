require 'rails_helper'

RSpec.describe Member, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.create(:member)).to be_valid
  end

  it "is invalid without a user_name" do
    member = FactoryBot.build(:member, user_name: nil)
    member.valid?
    expect(member.errors[:user_name]).to include('を入力してください', "は不正な値です") 
  end

  it "has a valid factory" do
    member = FactoryBot.build(:member, room: nil)
    member.valid?
    expect(member.errors[:room]).to include("を入力してください") 
  end

  it "is invalid without an email address" do
    member = FactoryBot.build(:member, email: nil)
    member.valid?
    expect(member.errors[:email]).to include("を入力してください") 
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:member)
    member = FactoryBot.build(:member)
    member.valid?
    expect(member.errors[:email]).to include("はすでに存在します")
  end

end
