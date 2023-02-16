class BookmarksController < ApplicationController
  before_action :set_store

  def create
    @bookmark =  Bookmark.new(user_id: current_user.id, store_id: params[:store_id])
    @bookmark.save
    
    render turbo_stream: turbo_stream.replace(
      'bookmark',
      partial: 'bookmarks/bookmark',
      locals: { store: @store },
    )
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, store_id: params[:store_id])
    @bookmark.destroy!
    
    render turbo_stream: turbo_stream.replace(
      'bookmark',
      partial: 'bookmarks/bookmark',
      locals: { store: @store },
    )
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end
end
