# frozen_string_literal: true

require 'application_system_test_case'

class FromLoginToWriteReportsTest < ApplicationSystemTestCase
  setup do
    @user = create(:test_user)
    create(:test_report, user_id: @user.id)
    visit user_session_url

    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_on 'ログイン'
  end

  test 'login user' do
    visit books_url

    assert_selector 'h1', text: '本'
  end

  test 'create report' do
    visit new_report_url

    assert_difference 'Report.count', 1 do
      fill_in 'report_title', with: '【日報】タイトル：システムテスト'
      fill_in 'report_content', with: '【日報】内容：システムテスト'
      click_on '登録する'
    end
  end

  test 'update report' do
    visit reports_url

    report = Report.find(1)
    click_on '編集'

    fill_in 'report_title', with: '編集後 日報タイトル 編集後'
    fill_in 'report_content', with: '編集後 編集内容 編集後'
    click_on '更新する'

    edited_report = Report.find(1)

    assert_text '編集後 日報タイトル 編集後'
    assert_text '編集後 編集内容 編集後'
    assert_not_equal(report.title, edited_report.title)
    assert_not_equal(report.content, edited_report.content)
  end

  test 'delete report' do
    visit reports_url
    assert_difference 'Report.count', 0 do
      accept_confirm do
        click_on '削除'
      end
    end
  end
end
