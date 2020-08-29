class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user.authenticate(params[:password])
            flash[:notice] = "login successfully."
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:flash] = "login unsuccessfully."
            render "new"
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end
