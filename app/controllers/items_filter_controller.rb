class ItemsFilterController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @items = @project.items.where(category: params[:categories]).order(:category)
  end
end
