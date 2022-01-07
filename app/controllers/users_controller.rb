# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @followings = @user.following_users.page(params[:page])
  end

  def followers
    @followers = @user.followed_users.page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
