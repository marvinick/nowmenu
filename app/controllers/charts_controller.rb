class ChartsController < ApplicationController
  before_action :set_project

  def items_chart
    render json: @project.items.group_by_day(:created_at).count
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
