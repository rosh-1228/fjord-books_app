# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user
  end

  def followings
    @followings = @user.followed_users.page(params[:page]).with_attached_avatar
  end

  def followers
    @followers = @user.following_users.page(params[:page]).with_attached_avatar
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
