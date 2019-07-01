class GroupsController < ApplicationController
  before_action :set_project
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  caches_action :index, :edit, :new

  def index
    @group = @project.groups.build
    @groups = @project.groups.order(created_at: :desc)
  end

  # def sort
  #   groups = @project.groups.all
  #
  #   params[:group].each_with_index do |id, index|
  #     groups.where(id: id).update_all(position: index + 1)
  #   end
  #   head :ok
  # end

  def new
    @group = @project.groups.build
  end

  def create
    @group = @project.groups.new(group_params)

    respond_to do |f|

      if @group.save
        f.html { redirect_to project_groups_path(@project, @groups), notice: "You have a created a new group!" }
        f.json { render :show, status: :created, location: @group }
        f.js
      else
        f.html { render :new, alert: "something's wrong!" }
        f.json { render json: @group.errors, status: :unprocessable_entity }
        f.js
      end
    end
  end

  def edit; end

  def update
    if @group.update_attributes(group_params)
      redirect_to project_groups_path(@project, @groups), notice: "You have successfully updated #{@group.name}"
    else
      render :edit, alert: "something's wrong!"
    end
  end

  def destroy
    @group.destroy
    redirect_to project_groups_path(@project, @groups), notice: "a group has been deleted!"
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
