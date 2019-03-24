class ItemsController < BaseController
  before_action :set_project
  before_action :set_item, only: [:show, :edit, :update, :destroy, :result]
  caches_action :index, :show, :preview, :result

  def index
    # @items = @project.items.with_attached_image.includes(:image_attachment)
    @items = @project.items.all
  end

  def preview
    @categories = @project.items.all.order(:category).pluck(:category).uniq
    # @categories = @project.items.all.joins(:group_items).order("group_items.group_id").pluck("group_items.group_id").uniq
    @items = @project.items.all
  end

  # def sort
  #
  #   items = @project.items.all
  #   params[:item].each_with_index do |id, index|
  #
  #     items.where(id: id).update_all(position: index + 1)
  #   end
  #   head :ok
  # end

  def new
    @item = @project.items.build
  end

  def create
    @item = @project.items.new(item_params)
    @item.user_id = @project.user_id
    if @item.save
      redirect_to project_item_path(@project, @item), notice: "You have successfully created #{@item.title}!"
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @item.user_id = @project.user_id
    if @item.update_attributes(item_params)
      redirect_to project_item_path(@project, @item), notice: "You have successfully edited #{@item.title}"
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

  def result
    item_dataframe
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :user_id, :category, :position, :price, :image, :project_id, :group_id, group_ids: [])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_item
    @item = @project.items.find(params[:id])
  end

  def get_keys
    total_keys = []
    @item.reviews.each do |review|
      review.properties.each_key do |k|
        total_keys << k.to_s
      end
    end
    total_keys
  end

  def get_values
    total = []
    @item.reviews.each do |review|
      review.properties.each_value do |v|
        total << v.to_i
      end
    end
    total
  end

  def item_dataframe
    # df1 = Daru::DataFrame.from_csv('biostats.csv', liberal_parsing: true)
    df1 = Daru::DataFrame.new({
      a: [get_keys],
      b: [get_values]
      }, index: 'a'..'f')

    options2 = {
      adapter: :datatables,
      html_options: {
        table_options: {
          cellspacing: '0',
          width: "100%"
        }
      }
    }
    @dt_df1 = Daru::View::Table.new(df1, options2)
  end

end
