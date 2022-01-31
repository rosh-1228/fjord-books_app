# frozen_string_literal: true

FactoryBot.define do
  factory :test_report, class: Report do
    user_id { _ }
    title { 'reportテスト _title' }
    content { 'reportテスト_content' }
  end
end
