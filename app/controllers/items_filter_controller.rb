class ItemsFilterController < ApplicationController
  def index
    @project = Project.find(params[:id])
    @items = @project.items.where(group: params[:groups]).order(:group)
  end
end
