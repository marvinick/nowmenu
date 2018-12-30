module ProjectsHelper

  def project_owner?
    @project.user_id == current_user.id
  end

end
