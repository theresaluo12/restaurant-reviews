class ReviewsController < ApplicationController
    def new
        @review = Review.new
        @restaurant = Restaurant.find(params[:restaurant_id])
        # render a view that displays the form
    end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new(review_params)
        @review.restaurant = @restaurant
        if @review.save
            redirect_to restaurant_path(@restaurant), notice: "Review successfully created"
        else
            render :new
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        byebug
        redirect_to restaurant_path(@review.restaurant)
    end

    private

    def review_params
        params.require(:review).permit(:content)
    end
end
