# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = create(:test_book)
    create(:test_book_second)
    @user = create(:test_user)
    visit user_session_url

    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '登録する'

    assert_text '本が作成されました。'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url

    click_on '編集', match: :prefer_exact

    fill_in 'book[memo]', with: '編集後メモ'
    fill_in 'book[title]', with: '編集後タイトル'
    click_on '更新する'

    assert_text '本が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
