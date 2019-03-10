class FaqsController < ApplicationController
  before_action :set_project
  before_action :set_faq, only: [:show, :edit, :update, :destroy]

  def index
    @faqs = @project.faqs.all
  end

  def new
    @faq = @project.faqs.build
  end

  def create
    @faq = @project.faqs.new(faq_params)
    if @faq.save
      redirect_to project_path(@project), notice: "You have posted a new faq item"
    else
      render "new", alert: "something is wrong"
    end
  end

  def show; end

  def edit; end

  def update
    if @faq.update_attributes(faq_params)
      redirect_to project_path(@project), notice: "you've updated this faq"
    else
      render "edit", alert: "something is wrong"
    end
  end

  def destroy
    if @faq.destroy
      redirect_to project_path(@project), notice: "You have deleted the faq"
    end
  end

  private

  def faq_params
    params.require(:faq).permit(:ask, :answer, :project_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_faq
    @faq = @project.faqs.find(params[:id])
  end
end
