class CategoriesController < BaseController
  before_action :set_project
  before_action :set_category, only: [:edit, :update, :destroy, :show]

  def index
    @categories = @project.categories.all
  end

  def new
    @category = @project.categories.build
  end

  def create
    @category = @project.categories.new(category_params)
    if @category.save
      redirect_to project_categories_path(@project, @categories), notice: "success!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      redirect_to project_categories_path(@project, @categories), notice: "success!"
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to [@project], notice: "Success!"
    else
      redirect_to [@project], alert: "Something's wrong!"
    end
  end


  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :project_id)
  end

  def set_category
    @category = @project.categories.find(params[:id])
  end
end
