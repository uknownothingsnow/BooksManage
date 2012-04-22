class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end
end
