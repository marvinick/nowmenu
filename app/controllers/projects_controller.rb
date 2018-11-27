class ProjectsController < ApplicationController 
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index 
        @projects = Project.all 
    end 

    def new 
        @project = Project.new 
    end 

    def create w
        @project = Project.new(project_params)
        if @project.save 
            redirect_to projects_path(@projects)
        else 
            render :new
        end 
    end 

    def show
        @project = Project.find(params[:id])
    end 

    def edit; end 

    def update 
        if @project.update_attributes(project_params)
            redirect_to root_path 
        else 
            render :edit
        end 
    end 

    def destroy
        if @project.destroy
            redirect_to root_path 
        else 
            redirect_to project_path(@project)
        end 
    end 

    private 

    def project_params
        params.require(:project).permit(:name, :description)
    end 

    def set_project 
        @project = Project.find(params[:id])
    end 
end 