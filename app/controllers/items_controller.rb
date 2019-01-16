class ItemsController < BaseController
  before_action :set_project
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @project.items.all
  end

  def sort

    items = @project.items.all
    params[:item].each_with_index do |id, index|

      items.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  def new
    @item = @project.items.build
  end

  def create
    @item = @project.items.new(item_params)
    @item.user_id = @project.user_id
    if @item.save
        redirect_to project_item_path(@project, @item)
    else
      render :new
    end
  end

  def show

  end

  def edit; end

  def update
    @item.user_id = @project.user_id
    if @item.update_attributes(item_params)

      redirect_to project_item_path(@project, @item)
    else
        render :edit
    end
  end

  def destroy
    if @item.destroy
        redirect_to project_items_path(@project, @items), notice: "You have deleted the item"
    else
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :user_id, :position, :price, :image, :project_id, group_ids: [])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_item
    @item = @project.items.find(params[:id])
  end

end
