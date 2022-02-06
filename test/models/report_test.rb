# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = create(:test_user)
    @other_user = create(:test_other_user)
    @report = create(:test_report, user_id: @user.id)
  end

  test 'create report have title and content' do
    assert_difference 'Report.count', 1 do
      create(:test_report, user_id: @user.id)
    end
  end

  test 'is edited report real user?' do
    assert @report.editable?(@user)
  end

  test 'is edited report not real user?' do
    assert_not @report.editable?(@other_user)
  end

  test 'report date change (%a, %d %b %Y)' do
    assert /(?:(Sun)|(Mon)|(Tue)|(Wed)|(Thu)|(Fri)|(Sat)),\s(0[1-9]|[12][0-9]|3[01])\s(?:(Jan)|(Feb)|(Mar)|(Apr)|(May)|(Jun)|(Jul)|(Aug)|(Sep)|(Oct)|(Nov)|(Dec)|)\s[0-9]{4}/.match(@report.created_on.strftime('%a, %d %b %Y'))
  end
end
