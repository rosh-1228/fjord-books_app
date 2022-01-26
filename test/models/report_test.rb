# frozen_string_literal: true

require "test_helper"

class ReportTest < ActiveSupport::TestCase

  setup do
    @user = User.create!(
      email: "autoreporttest@example.com",
      password: 'password'
    )
    @report = @user.reports.create!(title: 'reportテスト_title', content: 'reportテスト_content', user_id: @user.id)
  end

  test 'タイトルと本文がが存在すれば保存できること' do
    assert_difference 'Report.count', 1 do
      @user.reports.create!(title: 'reportテスト_title', content: 'reportテスト_content', user_id: @user.id)
    end
  end

  test '日報を書いた本人であることを確認できること' do
    assert @report.editable?(@user)
  end


  test '日報を書いた本人でないことを確認できること' do
    user2 = User.create!(
      email: "autoreporttest2@example.com",
      password: 'password'
    )
    assert_not @report.editable?(user2)
  end

  test '日報作成日が曜日, 日付 月 年の形式に変換されること' do
    assert_match Date.today.to_s, @report.created_on.to_s
  end
end
