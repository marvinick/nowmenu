class ItemsController < BaseController
  before_action :set_project
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
      @items = @project.items.all
  end

  def new
      @item = @project.items.build
  end

  def create
      @item = @project.items.new(item_params)
      if @item.save
          redirect_to project_item_path(@project, @item)
      else
          render :new
      end
  end

  def show; end

  def edit; end

  def update
      if @item.update_attributes(item_params)
          redirect_to project_item_path(@project, @item)
      else
          render :edit
      end
  end

  def destroy
      if @item.destroy
          redirect_to project_path(@project)
      else
      end
  end

  private

  def item_params
      params.require(:item).permit(:title, :content, :price, :project_id, group_ids: [], images: [])
  end

  def set_project
      @project = Project.find(params[:project_id])
  end

  def set_item
      @item = set_project.items.find(params[:id])
  end

end
