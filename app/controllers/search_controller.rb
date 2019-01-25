class SearchController < ApplicationController

  def search
    @projects = Project.ransack(name_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @projects = @projects.limit(5)
      }
    end
  end


end
