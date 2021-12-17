# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :avatar, content_type: [:png, :jpg, :gif]
end
