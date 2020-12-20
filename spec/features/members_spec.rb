require 'rails_helper'

RSpec.feature "Members", type: :feature do
  scenario "user create a member" do
    room = FactoryBot.create(:room)

    visit root_path
    click_link "会員管理"
    click_link "会員の新規登録"

    fill_in 'session_user_name', with:"中光夫"
    fill_in "session_email", with:"nakanaka@gmail.com"
    fill_in "session_password", with:"nakanaka"
    fill_in "session_password_confirmation", with:"nakanaka"
    check "session_administrator"
    find("#member_room_id").find("option[value='1']").select_option

    click_button "登録"

    expect(page).to have_content "会員の詳細"
  end

  scenario "user login a member" do
    member = FactoryBot.create(:member)

    visit root_path
    click_link "ログイン"

    expect{
      fill_in 'session_user_name', with:"中光夫"
      fill_in "session_email", with:"nakanaka@gmail.com"
      fill_in "session_password", with:"nakanaka"
      fill_in "session_password_confirmation", with:"nakanaka"
      check "session_administrator"
      select 'member_room_id', from:'脳血管'
      click_button "完了"
 
      expect(page).to have_content "チャットルーム"
     }
  end
end
