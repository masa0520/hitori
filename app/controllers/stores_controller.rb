class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  def index
    @stores = Store.all
  end

  def show
    @reviews = @store.reviews.includes(:user).order(created_at: :desc)
  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = current_user.stores.build(store_params)
    if @store.save
      redirect_to store_url(@store), success: "Store was successfully created."
    else
      flash.now[:danger] = '店名を入力してください'
      render :new
    end
  end

  def update
  end

  def destroy
    @store.destroy
    redirect_to stores_url, success: "Store was successfully destroyed."
  end

  def bookmarks
    @bookmarks = current_user.bookmarked_stores
  end

  private

    def set_store
      @store = Store.find(params[:id])
    end


    def store_params
      params.require(:store).permit(:title, :body, :address, :latitude, :longitude, :user_id, images: [])
    end
end
