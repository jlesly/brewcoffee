class SessionsController < ApplicationController
    def welcome
    end 

    def destroy
        session.delete :user_id
        redirect_to '/'
    end 

    def new
    end 

    def create
        @user = User.find_by_id(params[:id])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Login failed. Please try again."
            redirect_to '/login'
        end 
    end 

end
