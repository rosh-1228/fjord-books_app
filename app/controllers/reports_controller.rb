# frozen_string_literal: true

class ReportsController < ApplicationController
  include CommonModule
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    load_comments(params)
    @comment = Comment.new
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :study_date, :report_content).merge(user_id: current_user.id)
  end
end
