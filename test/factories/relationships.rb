# frozen_string_literal: true

FactoryBot.define do
  factory :test_relationship, class: Relationship do
    follower_id { 1 }
    following_id { 2 }
  end

  factory :test_other_relationship, class: Relationship do
    follower_id { 2 }
    following_id { 1 }
  end
end
