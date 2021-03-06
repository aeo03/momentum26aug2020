class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy] 

    def show 
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        session[:user_id] = @user.id
        if @user.save
            flash[:notice] = "User was created successfully."
            redirect_to root_path
        else
            flash[:flash] = "User was NOT created."
            render "new"
        end
    end

    def edit
    end

    def update
        
        @user.update(user_params)
        if @user.save
            flash[:notice] = "User was updated successfully."
            redirect_to @user
        else
            flash[:flash] = "User was NOT updated."
            render "edit"
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
