# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create(:test_user)
    @other_user = create(:test_other_user)
    @return_name_user = create(:test_name_user)
  end

  test 'can follow other user' do
    @user.follow(@other_user)
    assert Relationship.exists?(following: @other_user, follower: @user)
  end

  test 'can confirm following user' do
    create(:test_relationship)
    assert @user.following?(@other_user)
  end

  test 'can confirm follower' do
    create(:test_other_relationship)
    assert @user.followed_by?(@other_user)
  end

  test 'can unfollow following user' do
    @user.unfollow(@other_user)
    assert_not Relationship.exists?(following_id: 2)
  end

  test 'return email when no name' do
    assert_equal 'return_name_user', @return_name_user.name_or_email
  end

  test 'return name when name exist' do
    assert_not_equal 'return_name_user', @user.name_or_email
  end
end
