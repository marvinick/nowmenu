class ReviewsController < ApplicationController 
    before_action :set_item

    def new 
        @review = @item.reviews.new
    end 

    def create 
        @review = @item.reviews.builder(review_params)
        if @review.save 
            redirect_to root_path 
        else 
            render :new 
        end 
    end 

    def show; end 

    private 

    def review_params 
        params.require(:review).permit(:project_id, :private_review, :public_review)
    end 

    def set_item 
        project = Project.find(params[:project_id])
        @item = project.items.find(params[:item_id])
    end 

end 