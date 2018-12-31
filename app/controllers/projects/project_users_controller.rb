class Projects::ProjectUsersController < BaseController
    before_action :set_project

    def index
      @project_users = @project.project_users.all
    end

    def create
      project_user = @project.project_users.new(project_user_params)
      project_user.project = @project

      if project_user.save
        ProjectUserMailer.invite(project_user).deliver_now
        redirect_to @project, notice: 'Saved!'
      else
        redirect_to @project, alert: 'Failed saving!'
      end
    end

    def destroy
      
    end

    private

    def set_project
        @project = current_user.projects.find(params[:project_id])
    end

    def project_user_params
        params.require(:project_user).permit(:email)
      end
end
