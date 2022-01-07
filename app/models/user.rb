# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :followeds,
           class_name: :FollowRelationship,
           foreign_key: 'followed_id',
           dependent: :destroy,
           inverse_of: :followed
  has_many :followings,
           class_name: :FollowRelationship,
           foreign_key: 'following_id',
           dependent: :destroy,
           inverse_of: :following

  has_many :followed_users, through: :followeds, source: :following
  has_many :following_users, through: :followings, source: :followed

  def following?(other_user)
    followed_users.include?(other_user)
  end

  def follow!(other_user_id)
    followeds.create!(following_id: other_user_id)
  end

  def unfollow!(user)
    followeds.find_by(followed_id: user.followed_id).destroy
  end
end
