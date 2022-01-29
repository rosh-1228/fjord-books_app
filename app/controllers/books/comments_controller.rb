# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_book

  def create
    respond_to do |format|
      comment = @book.comments.create(comment_params)
      if comment.save
        format.html { redirect_to book_path(params[:book_id]), notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to book_path(params[:book_id]), alert: 'コメントを登録できませんでした。' }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to book_path(params[:book_id]), notice: t('controllers.common.notice_update', name: Comment.model_name.human) }
      else
        format.html { redirect_to book_path(params[:book_id]), alert: 'コメントを更新できませんでした。' }
      end
    end
  end

  def destroy
    @comment.destroy!
    redirect_to book_path(params[:book_id]), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_content, :commentable_type).merge(user_id: current_user.id)
  end
end
