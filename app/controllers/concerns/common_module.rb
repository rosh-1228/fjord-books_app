# frozen_string_literal: true

module CommonModule
  extend ActiveSupport::Concern
  def load_comments(params)
    load_model = params[:controller] == 'reports' ? Report.find(params[:id]) : Book.find(params[:id])
    @comments = load_model.comments.joins(:user).preload(:user)
  end
end
