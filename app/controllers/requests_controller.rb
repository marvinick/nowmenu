class RequestsController < ApplicationController
  before_action :set_project
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  caches_action :index, :show

  def index
    @requests = @project.requests.all
  end

  def new
    @request = @project.requests.build
  end

  def create
    @request = @project.requests.new(request_params)
    if @request.save
      redirect_to project_request_path(@project, @request), notice: "You have successfully created a request. We'll notify you when we got you in"
    else
      render :new, alert: "Something is wrong"
    end
  end

  def show; end

  def edit; end

  def update
    if @request.update_attributes(request_params)
      redirect_to project_request_path(@project, @request), notice: "You have successfully edited a request. We'll notify you when we got you in"
    else
      render :edit, alert: "Something is wrong"
    end
  end

  def destroy
    if @request.destroy
      redirect_to preview_project_path(@project), alert: "You have retracted your request"
    else
      redirect_to preview_project_path(@project), alert: "Something is wrong"
    end
  end

  private

  def set_request
    @request = @project.requests.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:full_name, :message, :project_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
