class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

def search
  users = User.scoped
  users = users.name_like(params[:name]) if params[:name].present?
  users = users.email_like(params[:email]) if params[:email].present?
  @users = users.page(params[:page]).per(10)
  render :index
end

end
