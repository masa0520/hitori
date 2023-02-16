class LikesController < ApplicationController
  before_action :set_store

  def create
    @liked = Like.new(user_id: current_user.id, store_id: params[:store_id])
    @liked.save

    render turbo_stream: turbo_stream.replace(
      'like',
      partial: 'likes/like',
      locals: { store: @store },
    )
  end

  def destroy
    @liked = Like.find_by(user_id: current_user.id, store_id: params[:store_id])
    @liked.destroy!

    render turbo_stream: turbo_stream.replace(
      'like',
      partial: 'likes/like',
      locals: { store: @store },
    )
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end
end
