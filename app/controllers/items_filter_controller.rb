class ItemsFilterController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @items = @project.items.where(group: params[:groups]).order(:group_id)
  end
end
