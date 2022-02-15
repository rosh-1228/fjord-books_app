# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  def create
    user_id = params[:followed_id]
    @user = User.find(user_id)
    current_user.follow!(user_id.to_i)
    redirect_to @user
  end

  def destroy
    @user = FollowRelationship.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to user_path(@user.following_id)
  end
end
