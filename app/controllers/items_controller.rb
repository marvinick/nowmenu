class ItemsController < BaseController
  before_action :set_project
  before_action :set_item, only: [:show, :edit, :update, :destroy, :result, :reviews_chart, :average_of_each_value]
  caches_action :index, :show, :preview, :result, expires_in: 1.hour

  def index
    # @items = @project.items.with_attached_image.includes(:image_attachment)
    @items = @project.items.all
    average_reviews = Daru::Vector.new(reviews_from_all_items)
    @average_reviews = average_reviews.mean
  end

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

  def show
    v = Daru::Vector.new(get_values)

    @v_mean = v.mean
    @v_summary = v.summary rescue 0
  end

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

  def delete_image
    @item_image = ActiveStorage::Attachment.find(params[:id])
    @item_image.purge
    redirect_back(fallback_location: request.referer)
  end

  def result
    item_dataframe
  end

  def average_of_each_value
    totals = array_of_review_properties_in_item.reduce({}) do |keys, values|
      keys.merge(values) { |_, a, b| a.to_i + b.to_i / values.count + 1  }
    end
    render json: totals
  end

  def chart_item_average_rating_in_index
    @items = @project.items.includes(:reviews)
    @item_name = []
    @items.each do |item|
      @item_name << item.title
    end

    render json: Hash[@item_name.zip(item_average_rating_in_index)]
  end

  def preview
    @categories = @project.items.all.order(:category).pluck(:category).uniq
    # @categories = @project.items.all.joins(:group_items).order("group_items.group_id").pluck("group_items.group_id").uniq
    @items = @project.items.all
  end

  def sort
    items = @project.items.all
    params[:item].each_with_index do |id, index|

      items.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :user_id, :category, :delete_image, :average_rating, :position, :price, :image, :project_id, :group_id, group_ids: [])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_item
    @item = @project.items.find(params[:id])
  end

  def array_of_review_properties_in_item
    array = []
    keys_values = []
    @item.reviews.each do |review|
      array << review.properties
    end
    array
  end

  #review in index
  def reviews_from_all_items
    total = []
    @items.each do |item|
      item.reviews do |review|
        review.properties.each_value do |v|
          total << v.to_i
        end
      end
    end
    total
  end

  def get_keys
    total = []
    @item.reviews.each do |review|
      review.properties.each_key do |k|
        total << k
      end
    end
    total
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
    @v = Daru::Vector.new get_values, type: :category
    df1 = Daru::DataFrame.rows([get_values], order: get_keys)
  end

  def item_average_rating_in_index
    sum_all = []

    @items.includes(:reviews).each do |item|
      all_total = []
      item.reviews.each do |review|
        total = []
        review.properties.each_value do |v|
          total << v.to_i
        end
        all_total << total.sum / review.properties.count
      end
     sum_all << all_total.sum / item.reviews.count rescue 0
    end
    sum_all
  end

end
