class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end 

  def show 
    @review = Review.find(params[:id])
  end 

  def new
    @review = Review.new
  end 

  def create
    @review = Review.create(review_params)
    if @review.valid? 
      redirect_to review_path(@review)
    else 
      flash[:errors] = @review.errors.full_messages
      redirect_to new_review_path
    end 
  end 

  def edit 
    @review = Review.find(params[:id])
  end 

  def update
    @review = Review.create(review_params)
    if @review.valid? 
      redirect_to review_path(@review)
    else 
      flash[:errors] = @review.errors.full_messages
      redirect_to edit_review_path
    end 
  end 

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end 

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :product_id, :user_id)
  end 

end
