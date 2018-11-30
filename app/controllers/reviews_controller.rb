class ReviewsController < ApplicationController 
    before_action :set_item

    def new 
        @review = Review.new(project_id: params[:project_id])
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

    private 

    def review_params 
        params.require(:review).permit(:project_id, :item_id, :private_review, :public_review, properties: {})
        # params.require(:review).tap do |whitelisted|
        #     whitelisted[:properties] = params[:review][:properties]
        #     whitelisted[:public_review] = params[:review][:public_review]
        #     whitelisted[:private_review] = params[:review][:private_review]
        # end
    end 

    def set_item 
        @project = Project.find(params[:project_id])
        @item = @project.items.find(params[:item_id])
    end 

end 