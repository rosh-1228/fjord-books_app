# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.create!(
      email: 'autousertest@example.com',
      password: 'password'
    )
    @other_user = User.create!(
      email: 'autousertest2@example.com',
      password: 'password'
    )
    @return_name_user = User.create!(
      email: 'returnname@example.com',
      password: 'password',
      name: 'return_name_user'
    )
  end

  test '別のユーザーをフォローできること' do
    assert @user.follow(@other_user)
  end

  test 'フォロー中の人が存在することを確認できること' do
    @user.follow(@other_user)
    assert @user.following?(@other_user)
  end

  test 'フォロワーが存在することを確認できること' do
    @other_user.follow(@user)
    assert @user.followed_by?(@other_user)
  end

  test '別のユーザのフォローを解除できること' do
    @user.unfollow(@other_user)
  end

  test 'ユーザーに名前がない場合Eメールを返すこと' do
    assert_equal 'return_name_user', @return_name_user.name_or_email
  end

  test 'ユーザーに名前がある場合、名前を返すこと' do
    assert_not_equal 'return_name_user', @user.name_or_email
  end
end
