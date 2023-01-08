class LikesController < ApplicationController
  def create
    @liked = Like.new(user_id: current_user.id, store_id: params[:store_id])
    @liked.save
    redirect_back fallback_location: stores_path
  end

  def destroy
    @liked = Like.find_by(user_id: current_user.id, store_id: params[:store_id])
    @liked.destroy!
    redirect_back fallback_location: stores_path
  end
end
