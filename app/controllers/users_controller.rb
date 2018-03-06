class UsersController < ApplicationController

    def index
        @users = User.all.sort
        authorize User
    end

    
    def update
      @user = User.find(params[:id])
      authorize @user
      if @user.update(user_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end
    
    def destroy
      user = User.find(params[:id])
      authorize user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    end
  
    private
  
    def user_params
      params.require(:user).permit(:role)
    end
end