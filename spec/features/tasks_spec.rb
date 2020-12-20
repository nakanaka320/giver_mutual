require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  scenario "user create a new task" do
    member = FactoryBot.create(:member)

    visit root_path
    click_link "ログイン"

    fill_in 'session_user_name', with: member.user_name
    fill_in "session_email", with: member.email
    fill_in "session_password", with: member.password
    fill_in "session_password_confirmation", with:member.password_confirmation
    check "session_administrator"
    find("#member_room_id").find("option[value='1']").select_option
    click_button "完了"

    click_link "業務登録"

    find("#task_kind").find("option[value='individual']").select_option
    fill_in "task_title", with: "titleのテスト"
    fill_in "task_content", with: "contentのテスト"

    find("#task_start_at_1i").find("option[value='2021']").select_option
    find("#task_start_at_2i").find("option[value='12']").select_option
    find("#task_start_at_3i").find("option[value='30']").select_option
    find("#task_start_at_4i").find("option[value='10']").select_option
    find("#task_start_at_5i").find("option[value='30']").select_option

    find("#task_finish_at_1i").find("option[value='2021']").select_option
    find("#task_finish_at_2i").find("option[value='12']").select_option
    find("#task_finish_at_3i").find("option[value='30']").select_option
    find("#task_finish_at_4i").find("option[value='11']").select_option
    find("#task_finish_at_5i").find("option[value='00']").select_option

    find("#task_time_required").find("option[value='30']").select_option
    click_button "作成する"

    expect(page).to have_content "私用 titleのテスト contentのテスト 2021-12-30 10:30:00 UTC 2021-12-30 11:00:00 "
  end
end
