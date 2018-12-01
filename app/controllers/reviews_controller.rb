class ReviewsController < BaseController 
    before_action :set_item
    before_action :set_review, only: [:show, :edit, :destroy, :update]

    def new 
        @review = Review.new(project_id: params[:project_id], item_id: params[:item_id])
    end 

    def create 
        @review = Review.new(review_params)
        if @review.save 
            redirect_to root_path 
        else 
            render :new 
        end 
    end 

    def show; end 

    def edit; end 

    def update 
        if @review.update_attributes(review_params)
            redirect_to project_item_review_path(@project, @item, @review)
        else
            render :edit 
        end 
    end 

    def destroy
    end 


    private 

    def review_params 
        params.require(:review).permit(:project_id, :item_id, :private_review, :public_review, properties: {})
        # params.require(:review).tap do |whitelisted|
        #     whitelisted[:properties] = params[:review][:properties]
        #     whitelisted[:public_review] = params[:review][:public_review]
        #     whitelisted[:private_review] = params[:review][:private_review]
        #     whitelisted[:project_id] = params[:review][:project_id]
        #     whitelisted[:item_id] = params[:review][:item_id]
        # end
    end 

    def set_item 
        @project = Project.find(params[:project_id])
        @item = @project.items.find(params[:item_id])
    end 

    def set_review 
        @review = @item.reviews.find(params[:id])
    end 

end 