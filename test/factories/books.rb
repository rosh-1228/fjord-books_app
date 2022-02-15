# frozen_string_literal: true

FactoryBot.define do
  factory :test_book, class: Book do
    title { 'first_title' }
    memo { 'first_memo' }
  end

  factory :test_book_second, class: Book do
    title { 'second_title' }
    memo { 'second_memo' }
  end
end
