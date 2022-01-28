# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_report

  def create
    respond_to do |format|
      if @report.comments.create(comment_params).valid?
        format.html { redirect_to report_path(params[:report_id]), notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to report_path(params[:report_id]), alert: 'コメントを登録できませんでした。' }
      end
    end
  end

  def edit
    set_report
    set_comment
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to report_path(params[:report_id]), notice: t('controllers.common.notice_update', name: Comment.model_name.human) }
      else
        format.html { redirect_to report_path(params[:report_id]), alert: 'コメントを更新できませんでした。' }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to report_path(params[:report_id]), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_report
    @report = Report.find(params[:report_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_content, :commentable_type).merge(user_id: current_user.id)
  end
end
