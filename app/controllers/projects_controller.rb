class ProjectsController < BaseController 
    
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index 
        @projects = current_user.projects 
    end 

    def new 
        @project = Project.new 
    end 

    def create
        @project = Project.new(project_params)
        @project.project_users.new(user: current_user, role: "owner" )
        if @project.save 
            redirect_to project_path(@project)
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
            redirect_to project_path(@project)
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
        params.require(:project).permit(:name, :description, categories_attributes: [:name, :_destroy, :required, :id])
    end 

    def set_project 
        @project = current_user.projects.find(params[:id])
    end 
end 