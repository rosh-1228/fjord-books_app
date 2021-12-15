# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session
  end
end
