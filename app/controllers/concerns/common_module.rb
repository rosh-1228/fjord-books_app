# frozen_string_literal: true

module CommonModule
  extend ActiveSupport::Concern
  def set_comments(params)
    load_model = params[:controller] == 'reports' ? Report.find(params[:id]): Book.find(params[:id])
    @comments = load_model.comments.joins(:user).preload(:user).select(:id, :created_at, :name, :email, :comment_content, :user_id)
  end
end
