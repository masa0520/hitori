class ReviewsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to store_url(@review.store_id), success: "レビューをしました"
    else
      flash.now[:danger] = 'レビューに失敗しました'
      render :new
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy!
    redirect_to store_path(@review.store_id)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rate).merge(store_id: params[:store_id])
  end
end
