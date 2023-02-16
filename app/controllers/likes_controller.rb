class LikesController < ApplicationController
  def create
    @store = Store.find(params[:store_id])
    @liked = Like.new(user_id: current_user.id, store_id: params[:store_id])
    @liked.save
    render turbo_stream: turbo_stream.replace(
      'like',
      partial: 'likes/like',
      locals: { store: @store },
    )
  end

  def destroy
    @store = Store.find(params[:store_id])
    @liked = Like.find_by(user_id: current_user.id, store_id: params[:store_id])
    @liked.destroy!
    render turbo_stream: turbo_stream.replace(
      'like',
      partial: 'likes/like',
      locals: { store: @store },
    )
  end
end
