class BookmarksController < ApplicationController
  def create
    @bookmark =  Bookmark.new(user_id: current_user.id, store_id: params[:store_id])
    @bookmark.save
    redirect_back fallback_location: stores_path
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, store_id: params[:store_id])
    @bookmark.destroy!
    redirect_back fallback_location: stores_path
  end
end
