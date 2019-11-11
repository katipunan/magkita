# frozen_string_literal: true

class Admin::UsersController < AdminController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path
  end
end
