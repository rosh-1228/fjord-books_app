# frozen_string_literal: true

FactoryBot.define do
  factory :test_user, class: User do
    id { 1 }
    email { 'test_user@example.com' }
    password { 'password' }
  end

  factory :test_other_user, class: User do
    id { 2 }
    email { 'test_other_user@example.com' }
    password { 'password' }
  end

  factory :test_name_user, class: User do
    id { 3 }
    email { 'test_name_user@example.com' }
    password { 'password' }
    name { 'return_name_user' }
  end
end
