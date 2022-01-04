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

  has_many :followed_users, through: :follow_relationships, source: :followed
  has_many :following_users, through: :follow_relationships, source: :following

  def following?(other_user)
    following_users.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    followed_users.create!(followed_id: other_user.id)
  end

  def unfollow!(user)
    followed_users.find_by(followed_id: other_user.id).destroy
  end
end
