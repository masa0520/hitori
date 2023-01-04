class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to users_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'ログインに失敗しました。'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to users_path, notice: 'Logged out!'
  end
end
