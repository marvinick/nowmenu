class ReviewsController < ApplicationController 

    def new 
        @review = @project.reviews.new(project_id: params[:project_id]) 
    end 

    def create 
        @review = @project.reviews.builder(review_params)
        if @review.save 
            redirect_to root_path 
        else 
            render :new 
        end 
    end 

    private 

    def review_params 
        params.require(:review).permit(:project_id, :private_review, :public_review)
    end 

end 