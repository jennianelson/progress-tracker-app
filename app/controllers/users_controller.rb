class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.filter_display(current_user)
      authorize User
    end

    def show
      authorize @user
    end

    def update
      authorize @user
      if @user.update(user_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end
    
    def destroy
      authorize @user
      @user.destroy
      redirect_to users_path, :notice => "User deleted."
    end
  
    private
  
    def user_params
      params.require(:user).permit(:role)
    end

    def set_user
      @user = User.find(params[:id])
    end
end