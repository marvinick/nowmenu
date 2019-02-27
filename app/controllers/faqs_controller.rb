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
      redirect_to [@project, @faqs], notice: "Posted a question"
    else
      render "new", alert: "something wrong"
    end
  end

  def show; end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def faq_params
    params.require(:faq).permit(:ask, :answer, :project_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_faq
    @faq = @project.fags.find(params[:id])
  end
end
