class ProfilesController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def show 
  end

  def edit 
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'プロフィールを更新しました'
    else
      flash.now[:alert] = 'プロフィールを更新に失敗しました'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :avatar)
  end
end
