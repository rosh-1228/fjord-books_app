FactoryBot.define do
  factory :test_report, class: Report do
    user_id { }
    title { 'reportテスト _title' }
    content { 'reportテスト_content' }
  end
end
