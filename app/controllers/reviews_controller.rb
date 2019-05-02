class ReviewsController < BaseController
    before_action :set_item
    before_action :set_review, only: [:show, :edit, :destroy, :update, :review_chart]
    caches_action :index, :show, :new, :edit

    def new
        @review = Review.new(project_id: params[:project_id], item_id: params[:item_id])
    end

    def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      if @review.save
          redirect_to [@project, @item]
      else
          render :new
      end
    end

    def show
      @review_score = Daru::Vector.new(each_review_average)
    end

    def edit; end

    def index
      @reviews = @item.reviews.all
    end

    def update
      if @review.update_attributes(review_params)
        redirect_to project_item_review_path(@project, @item, @review)
      else
        render :edit
      end
    end

    def destroy
      if @review.destroy
        redirect_to [@project, @item], alert: 'deleted!'
      end
    end

    def review_chart
      @reviews_chart = render json: @review.properties
    end


    private

    def review_params
      params.require(:review).permit(:project_id, :item_id, :user_id, :private_review, :public_review, properties: {})
    end

    def set_item
      @project = Project.find(params[:project_id])
      @item = @project.items.find(params[:item_id])
    end

    def set_review
      @review = @item.reviews.find(params[:id])
    end

    def each_review_average
      review_total_value = []
      @review.properties.each do |k, v|
        review_total_value << v.to_i
      end
      review_total_value
    end

end
