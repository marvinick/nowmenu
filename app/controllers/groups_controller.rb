class GroupsController < ApplicationController
  before_action :set_project
  before_action :set_group, only: [:show, :edit, :update, :destroy, :sort]

  def index
    @groups = @project.groups.all

  end

  def sort
    @itemss = @group.items.all


      params[:item].each_with_index do |id, index|
        @itemss.where(id: id).update_all(position: index + 1)
      end


  end

  def new
    @group = @project.groups.build
  end

  def create
    @group = @project.groups.new(group_params)
    if @group.save
      redirect_to project_path(@project), notice: "Success!"
    else
      render :new, alert: "something's wrong!"
    end
  end

  def edit; end

  def update
    if @group.update_attributes(group_params)
      redirect_to project_path(@project), notice: "Success!"
    else
      render :edit, alert: "something's wrong!"
    end
  end

  def destroy
    @group.destroy
    redirect_to project_path(@project), notice: "Success!"
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :project_id, :position)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_group
    @group = @project.groups.find(params[:id])
  end
end
