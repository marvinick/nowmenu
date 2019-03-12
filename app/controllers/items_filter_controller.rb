class ItemsFilterController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @items = @project.items.joins(:group_items).where(group_id: params[:group_ids])
  end
end
