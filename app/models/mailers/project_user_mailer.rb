class ProjectUserMailer < ApplicationMailer
    def invite(project_user)
        @project_user = project_user 
        mail(
            to: project_user.email,
            subject: "You've been invited to join the a project"
        )
    end 
end
