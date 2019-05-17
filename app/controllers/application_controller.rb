class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery with: :exception

  include Pundit
  include PublicActivity::StoreController

  def after_sign_in_path_for(resource)
    projects_path
  end
  # before_action :set_draftsman_whodunnit

end
